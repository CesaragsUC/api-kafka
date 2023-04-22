using Domain.Entidade;

namespace simple.api
{
    public interface ICategoriaService
    {
        Task Adicionar(Categoria categoria);
        Task Remove(Guid id);
        Task Atualizar(Categoria categoria);
    }
}
