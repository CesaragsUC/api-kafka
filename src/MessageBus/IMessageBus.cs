
using Simple.API.Core;

namespace Simple.API.MessageBus
{
    public interface IMessageBusConfig : IDisposable
    {
        Task ProducerAsync<T>(string topic, T message) where T : IntegrationEvent;
        Task ConsumerAsync<T>(string topic, Func<T, Task> onMessage, CancellationToken cancellation) where T : IntegrationEvent;
    }
}
