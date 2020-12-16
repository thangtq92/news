using WebApi.Entities;
using WebApi.Repository;

namespace WebApi.Services
{
	public interface IPostRelationService : IBaseService<PostRelations>
	{

	}

	public class PostRelationService : BaseService<PostRelations>, IPostRelationService
	{
		IPostRelationRepository _postRelationRepository;
		public PostRelationService(IPostRelationRepository postRelationRepository) : base(postRelationRepository)
		{
			_postRelationRepository = postRelationRepository;
		}
	}
}