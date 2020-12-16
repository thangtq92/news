using WebApi.Entities;
using WebApi.Repository;

namespace WebApi.Services
{
	public interface IPageStaticService : IBaseService<PageStatics>
	{

	}

	public class PageStaticService : BaseService<PageStatics>, IPageStaticService
	{
		IPageStaticRepository _pageStaticRepository;
		public PageStaticService(IPageStaticRepository pageStaticRepository) : base(pageStaticRepository)
		{
			_pageStaticRepository = pageStaticRepository;
		}
	}
}