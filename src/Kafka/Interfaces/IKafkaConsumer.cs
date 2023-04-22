namespace Kafka.Interfaces
{
    /// <summary>
    ///  Providencia o mecanismo para criar um Consumidor
    /// </summary>
    public interface IKafkaConsumer<TKey, TValue> where TValue : class
    {
        /// <summary>
        ///  Acionado quando o serviço está pronto para consumir o tópico Kafka.
        /// </summary>
        /// <param name="topic">Indica a chave da mensagem para o tópico Kafka</param>
        /// <param name="stoppingToken">Indica token de cancelamento</param>
        /// <returns></returns>
        Task Consume(string topic, CancellationToken stoppingToken);

        /// <summary>
        /// Isso fechará o consumidor, confirmará as compensações e deixará o grupo limpo.
        /// </summary>
        void Close();
        /// <summary>
        /// Libera todos os recursos usados pela instância atual do consumidor
        /// </summary>
        void Dispose();
    }
}
