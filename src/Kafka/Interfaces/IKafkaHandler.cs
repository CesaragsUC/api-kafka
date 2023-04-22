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
    /// <typeparam name="Tk">Indica a chave da mensagem para o tópico Kafka</typeparam>
    /// <typeparam name="Tv">Indica o valor da mensagem para o tópico Kafka</typeparam>
    public interface IKafkaHandler<Tk, Tv>
    {
        /// <summary>
        /// fornecer mecanismo para lidar com a mensagem do consumidor do Kafka
        /// </summary>
        /// <param name="key">Indica a chave da mensagem para o tópico Kafka</typeparam>
        /// <param name="value">Indica o valor da mensagem para o tópico Kafka</typeparam>
        /// <returns></returns>
        Task HandleAsync(Tk key, Tv value);
    }
}
