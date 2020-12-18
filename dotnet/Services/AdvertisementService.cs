using WebApi.Entities;
using WebApi.Repository;

namespace WebApi.Services
{
	public interface IAdvertisementService : IBaseService<Advertisements>
	{

	}

	public class AdvertisementService : BaseService<Advertisements>, IAdvertisementService
	{
		IAdvertisementRepository _advertisementRepository;
		public AdvertisementService(IAdvertisementRepository advertisementRepository) : base(advertisementRepository)
		{
			_advertisementRepository = advertisementRepository;
		}
	}
}