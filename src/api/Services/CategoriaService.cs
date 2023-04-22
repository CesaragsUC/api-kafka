
using Domain.Entidade;
using Domain.Interface;

namespace simple.api
{
    public class CategoriaService : BaseService, ICategoriaService
    {
        private readonly ICategoriaRepository _categoriaRepository;
        public CategoriaService(ICategoriaRepository categoriaRepository,
            INotificador notificador) :base(notificador)
        {
            _categoriaRepository = categoriaRepository;
        }
        public async Task Adicionar(Categoria categoria)
        {
            if (!ExecutarValidacao(new CategoriaValidation(), categoria)) return;
            await _categoriaRepository.Adicionar(categoria);
        }

        public async Task Atualizar(Categoria categoria)
        {
            if (!ExecutarValidacao(new CategoriaValidation(), categoria)) return;
            await _categoriaRepository.Atualizar(categoria);
        }

        public async Task Remove(Guid id)
        {
            await _categoriaRepository.Remover(id);
        }
    }
}
