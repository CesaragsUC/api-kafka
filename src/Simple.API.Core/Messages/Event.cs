using MediatR;

namespace Simple.API.Core
{
    public class Event : Message, INotification
    {

        public DateTime Timestamp { get; set; }

        public Event()
        {
            Timestamp = DateTime.Now;
        }
    }
}
