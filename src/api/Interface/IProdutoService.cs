using Domain.Entidade;
using FluentValidation.Results;

namespace simple.api
{
    public interface IProdutoService
    {
        Task Adicionar(Produto produto);
        Task Remove(Guid id);
        Task Atualizar(Produto produto);
    }
}
