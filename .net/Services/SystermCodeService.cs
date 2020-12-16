using WebApi.Entities;
using WebApi.Repository;

namespace WebApi.Services
{
	public interface ISystermCodeService : IBaseService<SystermCodes>
	{

	}

	public class SystermCodeService : BaseService<SystermCodes>, ISystermCodeService
	{
		ISystermCodeRepository _systermCodeRepository;
		public SystermCodeService(ISystermCodeRepository systermCodeRepository) : base(systermCodeRepository)
		{
			_systermCodeRepository = systermCodeRepository;
		}
	}
}