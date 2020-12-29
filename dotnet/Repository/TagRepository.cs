using Dapper;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Reflection;
using System.Threading.Tasks;
using WebApi.Entities;
using WebApi.Helpers.Extension;
using WebApi.Helpers.SqlServerDB;
using static System.Data.CommandType;

namespace WebApi.Repository
{
    public interface ITagRepository : IBaseRepository<Tags>
    {
        Task<List<Tags>> GetByPostId(int postId);
    }

    public class TagRepository : BaseRepository<Tags>, ITagRepository
    {
        private readonly IDbConnection cnn = null;
        public TagRepository(SqlServerStorage clientDB)
       : base(clientDB)
        {
            cnn = clientDB.iDbConnection;
        }
        public async Task<List<Tags>> GetByPostId(int postId)
		{
			DynamicParameters parameters = new DynamicParameters();
			parameters.Add("@PostId", postId, DbType.Int32);
			var result = await cnn.QueryAsync<Tags>("Tags_GetByPostId", parameters, commandType: StoredProcedure);
			return result.ToList();
		}
    }
}
