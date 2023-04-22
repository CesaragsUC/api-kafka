using Confluent.Kafka;
using Kafka.Interfaces;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kafka.Consumidor
{
    /// <summary>
    /// Classe base para implementação do Kafka Consumer.
    /// </summary>
    /// <typeparam name="TKey"></typeparam>
    /// <typeparam name="TValue"></typeparam>
    public class KafkaConsumidor<TKey, TValue> : IKafkaConsumer<TKey, TValue> where TValue : class
    {
        private readonly ConsumerConfig _config;
        private IKafkaHandler<TKey, TValue> _handler;
        private IConsumer<TKey, TValue> _consumer;
        private string _topic;

        private readonly IServiceScopeFactory _serviceScopeFactory;

        /// <summary>
        /// Indica o construtor para inicializar o serviceScopeFactory e o ConsumerConfig
        /// </summary>
        /// <param name="config">Configurações do consumidor</param>
        /// <param name="serviceScopeFactory">Instancia do serviceScopeFactory</param>
        public KafkaConsumidor(ConsumerConfig config, IServiceScopeFactory serviceScopeFactory)
        {
            _config = config;
            _serviceScopeFactory = serviceScopeFactory;
        }

        /// <summary>
        /// Acionado quando o serviço está pronto para consumir o tópico Kafka.
        /// </summary>
        /// <param name="topic">Topico no Kafka</param>
        /// <param name="stoppingToken">Indica stopping token</param>
        /// <returns></returns>
        public async Task Consume(string topic, CancellationToken stoppingToken)
        {
           using var scope = _serviceScopeFactory.CreateScope();
            _handler = scope.ServiceProvider.GetRequiredService<IKafkaHandler<TKey, TValue>>();
            _consumer = new ConsumerBuilder<TKey, TValue>(_config).SetValueDeserializer(new KafkaDeserializer<TValue>()).Build();
            _topic = topic;

            await Task.Run(() => StartConsumerLoop(stoppingToken), stoppingToken);
        }

        private async Task StartConsumerLoop(CancellationToken cancellationToken)
        {
            _consumer.Subscribe(_topic);

            while (!cancellationToken.IsCancellationRequested)
            {
                try
                {
                    var result = _consumer.Consume(cancellationToken);

                    if (result != null)
                    {
                        await _handler.HandleAsync(result.Message.Key, result.Message.Value);
                    }
                }
                catch (OperationCanceledException)
                {
                    break;
                }
                catch (ConsumeException e)
                {
                    // Consumer errors should generally be ignored (or logged) unless fatal.
                    Console.WriteLine($"Consume error: {e.Error.Reason}");

                    if (e.Error.IsFatal)
                    {
                        break;
                    }
                }
                catch (Exception e)
                {
                    Console.WriteLine($"Unexpected error: {e}");
                    break;
                }
            }
        }

        public void Dispose()
        {
            _consumer.Dispose();
        }

        public void Close()
        {
            _consumer.Close();
        }
    }
}
