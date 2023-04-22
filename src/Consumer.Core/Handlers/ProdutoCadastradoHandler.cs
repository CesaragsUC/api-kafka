using Domain.Entidade;
using Domain.Interface;
using Kafka.Constantes;
using Kafka.Interfaces;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;
using Simple.API.Core;

namespace Consumer.Core.Handlers
{
    public class ProdutoCadastradoHandler : IKafkaHandler<string, ProdutoRegistradoIntegrationEvent>
    {

        private readonly IKafkaProducer<string, ProdutoRegistradoIntegrationEvent> _producer;
        private readonly IServiceProvider _serviceProvider;
        private readonly ILogger<ProdutoCadastradoHandler> _logger;

        public ProdutoCadastradoHandler(IKafkaProducer<string, ProdutoRegistradoIntegrationEvent> producer,
            IServiceProvider serviceProvider,
            ILogger<ProdutoCadastradoHandler> logger)
        {
            _producer = producer;
            _serviceProvider = serviceProvider;
            _logger = logger;
        }

        //obs: nao usar o async, do contrario nao vai chamar o handler
        public  Task HandleAsync(string key, ProdutoRegistradoIntegrationEvent value)
        {
            // Aqui podemos realmente escrever o código para registrar um Produto se for o caso
            _logger.LogInformation($"Consumindo Topico ProdudoCadastrado com os seguintes dados\n Produto: {value.Nome}\n Valor: {value.Valor}\n UserName: {value.Quantidade}\n Data Cadastro: {value.DataCadastro}");
           
             ProdutoRegistrado(value);

            //Aqui podemos produzir uma nova mensagem para ser consumido em outro topico no Kafka
            _producer.ProduceAsync(KafkaTopicos.TopicoTeste, "", null);

            return Task.CompletedTask;
        }



        private Task ProdutoRegistrado(ProdutoRegistradoIntegrationEvent message)
        {

            var produto = new Produto
            {
                Id = message.Id,
                Valor = message.Valor,
                Nome = message.Nome,
                Imagem = message.Imagem,
                Quantidade = 150,
                Ativo = message.Ativo,
                CategoriaId = message.CategoriaId,
                DataCadastro = message.DataCadastro

            };

            using (var scope = _serviceProvider.CreateScope())
            {
                try
                {
                    var produtoRepository = scope.ServiceProvider.GetRequiredService<IProdutoRepository>();
                    produtoRepository.Atualizar(produto);

                }
                catch (Exception ex )
                {

                    throw ex;
                }

            }

            Console.ForegroundColor = ConsoleColor.Red;
            Console.WriteLine($"Foi alterado a quantidade em estoque do produto: {message.Nome}");
            Console.ResetColor();

            return Task.CompletedTask;
        }
    }
}
