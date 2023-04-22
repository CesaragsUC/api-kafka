
using Application.API.Model;
using Domain.Interface;
using Kafka.Constantes;
using Kafka.Interfaces;
using Kafka.Produtor;
using MediatR;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Options;
using Microsoft.IdentityModel.Tokens;
using Simple.API.Core;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

namespace simple.api
{
    [ApiController]
    [Route("api/Identidade")]
    public class AuthController : MainController
    {

        private readonly SignInManager<IdentityUser> _signInManager;
        private readonly UserManager<IdentityUser> _userManager;
        private readonly AppSettings _appSettings;
        private readonly IKafkaProducer<string, UsuarioRegistradoIntegrationEvent> _kafkaProducer;
        public AuthController(IHttpContextAccessor httpContextAccessor,
                                  SignInManager<IdentityUser> signInManager,
                                  UserManager<IdentityUser> userManager,
                                    INotificador notificador,
                                     IOptions<AppSettings> appSettings,
                                     IKafkaProducer<string, UsuarioRegistradoIntegrationEvent> kafkaProducer) : base(notificador)
        {
            _signInManager = signInManager;
            _userManager = userManager;
            _appSettings = appSettings.Value;
            _kafkaProducer = kafkaProducer;
        }

        //Nao tem tela, usar via  Postmam
        [HttpPost("nova-conta")]
        public async Task<ActionResult> Registrar(UsuarioRegistro usuarioRegistro)
        {
            if (!ModelState.IsValid) return CustomResponse(ModelState);

            var user = new IdentityUser
            {
                UserName = usuarioRegistro.Email,
                Email = usuarioRegistro.Email,
                EmailConfirmed = true
            };
            var result = await _userManager.CreateAsync(user, usuarioRegistro.Senha);

            if (result.Succeeded)
            {

                var usuario = await _userManager.FindByEmailAsync(usuarioRegistro.Email);
                var usuarioRegistrado = new UsuarioRegistradoIntegrationEvent(
                                        Guid.Parse(usuario.Id), usuarioRegistro.Nome, usuarioRegistro.Email, usuarioRegistro.Cpf);
                try
                {
                    await _kafkaProducer.ProduceAsync(KafkaTopicos.UsuarioCadastrado, null, usuarioRegistrado);


                }
                catch (Exception ex)
                {
                    await _userManager.DeleteAsync(usuario);
                    throw;
                }


                return CustomResponse(await GerarJwt(usuarioRegistro.Email));
            }

            return CustomResponse();
        }


        [AllowAnonymous]
        [HttpPost("api/login")]
        public async Task<IActionResult> Login([FromBody] LoginDTO login)
        {
            var result = await _signInManager.PasswordSignInAsync(login.Email, login.Senha, false, true);

            if (result.Succeeded)
            {
                return Ok(await GerarJwt(login.Email));
            }

            NotificarErro("Usuário ou Senha incorretos");
            return CustomResponse();
        }

        private async Task<string> GerarJwt(string email)
        {
            var user = await _userManager.FindByEmailAsync(email);
            var claims = await _userManager.GetClaimsAsync(user);

            claims.Add(new Claim(JwtRegisteredClaimNames.Sub, user.Id));
            claims.Add(new Claim(JwtRegisteredClaimNames.Email, user.Email));

            var identityClaims = new ClaimsIdentity();
            identityClaims.AddClaims(claims);

            var tokenHandler = new JwtSecurityTokenHandler();
            var key = Encoding.ASCII.GetBytes(_appSettings.Secret);
            var token = tokenHandler.CreateToken(new SecurityTokenDescriptor
            {
                Issuer = _appSettings.Emissor,
                Audience = _appSettings.ValidoEm,
                Subject = identityClaims,
                Expires = DateTime.UtcNow.AddHours(_appSettings.ExpiracaoHoras),
                SigningCredentials = new SigningCredentials(new SymmetricSecurityKey(key), SecurityAlgorithms.HmacSha256Signature)
            });

            var tokenResult = tokenHandler.WriteToken(token);
            return tokenResult;
        }

    }
}
