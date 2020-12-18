using WebApi.Entities;
using WebApi.Repository;

namespace WebApi.Services
{
	public interface ICommentService : IBaseService<Comments>
	{

	}

	public class CommentService : BaseService<Comments>, ICommentService
	{
		ICommentRepository _commentRepository;
		public CommentService(ICommentRepository commentRepository) : base(commentRepository)
		{
			_commentRepository = commentRepository;
		}
	}
}