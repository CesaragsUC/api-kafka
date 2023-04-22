

using Confluent.Kafka;
using Consumer.Core.Consumers;
using Consumer.Core.Handlers;
using Kafka.Consumidor;
using Kafka.Interfaces;
using Kafka.Produtor;
using Simple.API.Core;

namespace simple.api
{
    public static class DependencyInjectionExtensions
    {

        public static void AddMessageBusConfiguration(this IServiceCollection services,
          IConfiguration configuration)
        {
            services.AddHostedService<ProdutoCadastradoConsumer>();
            services.AddHostedService<UsuarioCadastradoConsumer>();

            // Kafka Configuração
            var clientConfig = new ClientConfig()
            {
                BootstrapServers = configuration["MessageQueueConnection:MessageBus"]
            };

            var producerConfig = new ProducerConfig(clientConfig);
            var consumerConfig = new ConsumerConfig(clientConfig)
            {
                GroupId = "xgameapi",
                EnableAutoCommit = true,
                AutoOffsetReset = AutoOffsetReset.Earliest,
                StatisticsIntervalMs = 5000,
                SessionTimeoutMs = 6000
            };

            services.AddSingleton(producerConfig);
            services.AddSingleton(consumerConfig);


            services.AddScoped<IKafkaHandler<string, UsuarioRegistradoIntegrationEvent>, UsuarioCadastradoHandler>();
            services.AddScoped<IKafkaHandler<string, ProdutoRegistradoIntegrationEvent>, ProdutoCadastradoHandler>();

            services.AddSingleton(typeof(IKafkaProducer<,>), typeof(KafkaProdutor<,>));
            services.AddSingleton(typeof(IKafkaConsumer<,>), typeof(KafkaConsumidor<,>));


            //services.AddMessageBus(configuration.GetMessageQueueConnection("MessageBus"))
            //     .AddHostedService<ProdutoCadastradoConsumer>();
        }
    }
}