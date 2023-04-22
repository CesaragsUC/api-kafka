using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kafka.Interfaces
{

    /// <summary>
    /// Fornece mecanismo para criar Kafka Handler
    /// </summary>
    /// <typeparam name="TKey">Indica a chave da mensagem para o tópico Kafka</typeparam>
    /// <typeparam name="TValue">Indica o valor da mensagem para o tópico Kafka</typeparam>
    public interface IKafkaProducer<in TKey, in TValue> where TValue : class
    {
        /// <summary>
        ///  Acionado quando o serviço está pronto para produzir o tópico Kafka.
        /// </summary>
        /// <param name="topic">Indica nome do topico</param>
        /// <param name="key">Indica a chave da mensagem no tópico Kafka</param>
        /// <param name="value">indica o valor da mensagem no tópico Kafka</param>
        /// <returns></returns>
        Task ProduceAsync(string topic, TKey key, TValue value);
    }
}
