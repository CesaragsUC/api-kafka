using Kafka.Constantes;
using Kafka.Interfaces;
using Microsoft.Extensions.Hosting;
using Simple.API.Core;
using System.Net;

namespace Consumer.Core.Consumers
{
    public class ProdutoCadastradoConsumer : BackgroundService
    {

        private readonly IKafkaConsumer<string, ProdutoRegistradoIntegrationEvent> _consumer;
        public ProdutoCadastradoConsumer(IKafkaConsumer<string, ProdutoRegistradoIntegrationEvent> consumer)
        {
            _consumer = consumer;
        }

        protected override async Task ExecuteAsync(CancellationToken stoppingToken)
        {
            try
            {
                await _consumer.Consume(KafkaTopicos.ProdutorCadastrado, stoppingToken);
            }
            catch (Exception ex)
            {
                Console.WriteLine($"{(int)HttpStatusCode.InternalServerError} Falha ao consumir o topico - {KafkaTopicos.ProdutorCadastrado}, {ex}");
            }
        }

        public void Dispose()
        {
            _consumer.Close();
            _consumer.Dispose();

            base.Dispose();
        }

    }
}
