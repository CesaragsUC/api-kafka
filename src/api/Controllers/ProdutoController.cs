using AutoMapper;
using Domain.Entidade;
using Domain.Interface;
using Kafka.Constantes;
using Kafka.Interfaces;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using Simple.API.Core;


namespace simple.api
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProdutoController : MainController
    {
        private readonly IProdutoRepository _produtoRepository;
        private readonly IProdutoService _produtoService;
        public readonly IMapper _mapper;
        private readonly IKafkaProducer<string, ProdutoRegistradoIntegrationEvent> _kafkaProducer;
        private readonly ICacheService _cache;
        private readonly ILogger<ProdutoController> _logger;
        public ProdutoController(
            IProdutoRepository produtoRepository,
            IProdutoService produtoService,
            IMapper mapper,
            INotificador notificador,
            ICacheService cache,
            ILogger<ProdutoController> logger,
            IKafkaProducer<string, ProdutoRegistradoIntegrationEvent> kafkaProducer) : base(notificador)
        {
            _produtoRepository = produtoRepository;
            _produtoService = produtoService;
            _mapper = mapper;
            _cache = cache;
            _logger = logger;
            _kafkaProducer = kafkaProducer;
        }

        [HttpGet]
        [Route("todos")]
        public async Task<IActionResult> GetAll()
        {
            try
            {
                //var produtoCache = await _cache.GetAsync("produtos");
                IEnumerable<ProdutoDTO> produtos;

                //if (!string.IsNullOrWhiteSpace(produtoCache))
                //{
                //    produtos = JsonConvert.DeserializeObject<IEnumerable<ProdutoDTO>>(produtoCache);
                //    _logger.LogWarning("Readed from cache");
                //    return CustomResponse(produtos);
                //}

                var result = await _produtoRepository.ObterProdutos();
                produtos = _mapper.Map<IEnumerable<ProdutoDTO>>(result);
                // await _cache.SetAsync("produtos",JsonConvert.SerializeObject(produtos));

                return CustomResponse(produtos);
            }
            catch (Exception ex)
            {

                return CustomResponse("Ocorreu um erro.");
            }
        }

        [HttpGet]
        [Route("by-id/{id}")]
        public async Task<IActionResult> GetById(Guid id)
        {
            if (id == Guid.Empty) return BadRequest("Id invalido.");

            try
            {
                var produto = new ProdutoDTO();
                var produtoCache = await _cache.GetAsync(id.ToString());
                if (!string.IsNullOrWhiteSpace(produtoCache))
                {
                    produto = JsonConvert.DeserializeObject<ProdutoDTO>(produtoCache);
                    _logger.LogWarning("Readed from cache");
                    return CustomResponse(produto);
                }

                var result = await _produtoRepository.ObterProdutoPorId(id);
                produto = _mapper.Map<ProdutoDTO>(result);

                await _cache.SetAsync(produto.Id.ToString(), JsonConvert.SerializeObject(produto));

                return CustomResponse(produto);
            }
            catch (Exception ex)
            {

                return BadRequest("Ocorreu um erro.");
            }
        }

        [HttpPost]
        [Route("novo-produto")]
        public async Task<IActionResult> Add(ProdutoAddDTO model)
        {

            try
            {

                var produto = _mapper.Map<Produto>(model);
                await _produtoService.Adicionar(produto);
                if (OperacaoValida())
                {
                    var produtoRegistrado = new ProdutoRegistradoIntegrationEvent(produto.Id, produto.Nome, produto.Imagem, produto.Valor,
                     produto.Quantidade, produto.Ativo, produto.CategoriaId);

                    await _kafkaProducer.ProduceAsync(KafkaTopicos.ProdutorCadastrado, null, produtoRegistrado);

                }


                return CustomResponse();
            }
            catch (Exception ex)
            {

                return CustomResponse("Ocorreu um erro ao criar o produto.");
            }

        }

        [HttpPut]
        [Route("editar")]
        public async Task<IActionResult> Edit(ProdutoEditDTO model)
        {
            var produto = await _produtoRepository.ObterProdutoPorId(model.Id);
            produto.Valor = model.Valor;
            produto.Nome = model.Nome;
            produto.Imagem = model.Imagem;
            produto.Quantidade = model.Quantidade;
            produto.Ativo = model.Ativo;
            produto.CategoriaId = model.CategoriaId;

            try
            {
                await _produtoService.Atualizar(produto);
                return CustomResponse();
            }
            catch (Exception ex)
            {

                return CustomResponse("Ocorreu um erro ao atualizar o produto.");
            }

        }

        [HttpDelete]
        [Route("remove/{id}")]
        public async Task<IActionResult> Remove(Guid id)
        {
            if (id == Guid.Empty) return BadRequest("Id invalido.");

            try
            {
                await _produtoRepository.Remover(id);
                return CustomResponse("Produto excluido com sucesso!");
            }
            catch (Exception ex)
            {

                return CustomResponse("Ocorreu um erro ao excluir o produto.");
            }
        }

    }
}
