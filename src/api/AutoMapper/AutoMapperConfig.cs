using simple.api;
using AutoMapper;
using Domain.Entidade;

namespace simple.api
{
    public class AutoMapperConfig : Profile
    {
        public AutoMapperConfig()
        {
            CreateMap<Categoria, CategoriaDTO>().ReverseMap();
            CreateMap<Produto, ProdutoDTO>().ReverseMap();
            CreateMap<Produto, ProdutoAddDTO>().ReverseMap();
            CreateMap<Categoria, CategoriaAddDTO>().ReverseMap();
            CreateMap<Categoria, CategoriaEditDTO>().ReverseMap();
            CreateMap<Produto, ProdutoEditDTO>().ReverseMap();

        }
    }
}
