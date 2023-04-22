using Domain.Entidade;
using Domain.Interface;
using Kafka.Constantes;
using Kafka.Interfaces;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Simple.API.Core;
using System.Net;

namespace Consumer.Core.Consumers
{
    public class UsuarioCadastradoConsumer : BackgroundService
    {

        private readonly IKafkaConsumer<string, UsuarioRegistradoIntegrationEvent> _consumer;
        public UsuarioCadastradoConsumer(IKafkaConsumer<string, UsuarioRegistradoIntegrationEvent> consumer)
        {
            _consumer = consumer;
        }

        protected override async Task ExecuteAsync(CancellationToken stoppingToken)
        {
            try
            {
                await _consumer.Consume(KafkaTopicos.UsuarioCadastrado, stoppingToken);
            }
            catch (Exception ex)
            {
                Console.WriteLine($"{(int)HttpStatusCode.InternalServerError} Falha ao consumir o topico - {KafkaTopicos.UsuarioCadastrado}, {ex}");
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
