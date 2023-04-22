using simple.api;
using Microsoft.Extensions.Caching.Distributed;

namespace simple.api
{
    public class CacheService : ICacheService
    {
        private readonly IDistributedCache _cache;
        private readonly DistributedCacheEntryOptions _options;

        public CacheService(IDistributedCache cache)
        {
            _cache = cache;
            _options = new DistributedCacheEntryOptions { 
                AbsoluteExpirationRelativeToNow = TimeSpan.FromSeconds(3600), //expiração 
                SlidingExpiration = TimeSpan.FromSeconds(1200), //https://learn.microsoft.com/pt-br/dotnet/api/microsoft.extensions.caching.memory.memorycacheentryoptions.slidingexpiration?view=dotnet-plat-ext-7.0
            };
        }

        public async Task<string> GetAsync(string key)
        {
           return  _cache.GetString(key);
        }

        public async Task SetAsync(string key, string value)
        {
             _cache.SetString(key, value);
        }
    }
}
