using Kafka.Constantes;
using Kafka.Interfaces;
using Microsoft.Extensions.Logging;
using Simple.API.Core;

namespace Consumer.Core.Handlers
{
    public class UsuarioCadastradoHandler : IKafkaHandler<string, UsuarioRegistradoIntegrationEvent>
    {

        private readonly IKafkaProducer<string, UsuarioRegistradoIntegrationEvent> _producer;
        private readonly IServiceProvider _serviceProvider;
        private readonly ILogger<UsuarioCadastradoHandler> _logger;
        public UsuarioCadastradoHandler(IKafkaProducer<string, UsuarioRegistradoIntegrationEvent> producer,
            IServiceProvider serviceProvider,
            ILogger<UsuarioCadastradoHandler> logger)
        {
            _producer = producer;
            _serviceProvider = serviceProvider;
            _logger = logger;
        }
        public  Task HandleAsync(string key, UsuarioRegistradoIntegrationEvent value)
        {
            // Aqui podemos realmente escrever o código para registrar um Produto se for o caso
            _logger.LogInformation($"Consumindo Topico UsuarioRegistrado com os seguintes dados\n Nome: {value.Nome}\n Email: {value.Email}\n CPF: {value.Cpf}\n Data Cadastro: {value.DataCadastro}");
           
            //Aqui podemos produzir uma nova mensagem para ser consumido em outro topico no Kafka
            _producer.ProduceAsync(KafkaTopicos.TopicoTeste, "", null);

            return Task.CompletedTask;
        }

    }
}
