using WebApi.Entities;
using WebApi.Repository;

namespace WebApi.Services
{
	public interface IPageService : IBaseService<Pages>
	{

	}

	public class PageService : BaseService<Pages>, IPageService
	{
		IPageRepository _pageRepository;
		public PageService(IPageRepository pageRepository) : base(pageRepository)
		{
			_pageRepository = pageRepository;
		}
	}
}