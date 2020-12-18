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
    public interface IAdvertisementPositionRepository : IBaseRepository<AdvertisementPositions>
    {
    }

    public class AdvertisementPositionRepository : BaseRepository<AdvertisementPositions>, IAdvertisementPositionRepository
    {
        private readonly IDbConnection cnn = null;
        public AdvertisementPositionRepository(SqlServerStorage clientDB)
       : base(clientDB)
        {
            cnn = clientDB.iDbConnection;
        }
    }
}
