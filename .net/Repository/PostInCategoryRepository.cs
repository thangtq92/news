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
    public interface IPostInCategoryRepository : IBaseRepository<PostInCategories>
    {
    }

    public class PostInCategoryRepository : BaseRepository<PostInCategories>, IPostInCategoryRepository
    {
        private readonly IDbConnection cnn = null;
        public PostInCategoryRepository(SqlServerStorage clientDB)
       : base(clientDB)
        {
            cnn = clientDB.iDbConnection;
        }
    }
}
