using Confluent.Kafka;
using Kafka.Interfaces;

namespace Kafka.Produtor
{
    /// <summary>
    /// Classe base para implementação do Kafka Producer.
    /// </summary>
    /// <typeparam name="TKey">IIndica a chave da mensagem no tópico Kafka</typeparam>
    /// <typeparam name="TValue">Indica o valor da mensagem no tópico Kafka</typeparam>
    public class KafkaProdutor<TKey, TValue> : IDisposable, IKafkaProducer<TKey, TValue> where TValue : class
    {
        private readonly IProducer<TKey, TValue> _producer;

        /// <summary>
        /// Inicializa o produtor
        /// </summary>
        /// <param name="config"></param>
        public KafkaProdutor(ProducerConfig config)
        {
            _producer = new ProducerBuilder<TKey, TValue>(config).SetValueSerializer(new KafkaSerializer<TValue>()).Build();
        }

        /// <summary>
        /// Acionado quando o serviço cria o tópico Kafka.
        /// </summary>
        /// <param name="topic">Indica o nome do tópico</param>
        /// <param name="key">Indica a chave da mensagem no tópico Kafka</param>
        /// <param name="value">Indica o valor da mensagem no tópico Kafka</param>
        /// <returns></returns>
        public async Task ProduceAsync(string topic, TKey key, TValue value)
        {
            await _producer.ProduceAsync(topic, new Message<TKey, TValue> { Key = key, Value = value });
        }

        /// <summary>
        /// 
        /// </summary>
        public void Dispose()
        {
            _producer.Flush();
            _producer.Dispose();
        }
    }
}
