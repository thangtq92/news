using Microsoft.Extensions.Options;
using Microsoft.IdentityModel.Tokens;
using System;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;
using WebApi.Entities;
using WebApi.Helpers;
using WebApi.Models;
using WebApi.Repository;

namespace WebApi.Services
{
	public interface IUserService : IBaseService<Users>
	{
		Task<AuthenticateResponse> Authenticate(AuthenticateRequest model);
		Task<Users> GetById(int id);

		Task<bool> IsExisted(string username);
	}

	public class UserService : BaseService<Users>, IUserService
	{
		private readonly AppSettings _appSettings;

		IUserRepository _userRepository;

		public UserService(IUserRepository userRepository, IOptions<AppSettings> appSettings) : base(userRepository)
		{
			_appSettings = appSettings.Value;
			_userRepository = userRepository;
		}

		public async Task<AuthenticateResponse> Authenticate(AuthenticateRequest model)
		{
			string SQLQuery = $"UserName = '{model.UserName}'";

			var user = await _userRepository.GetList(SQLQuery);

			// return null if user not found
			if (user == null || user.Count() == 0) return null;

			string hashPass = Security.HashSHA1(model.Password + model.UserName);
			if (hashPass != user.First().Password?.Trim()) return null;

			// authentication successful so generate jwt token
			var token = generateJwtToken(user.First());

			return new AuthenticateResponse(user.First(), token);
		}

		public async Task<Users> GetById(int id)
		{
			return await _userRepository.Get(id.ToString());
		}

		// helper methods

		private string generateJwtToken(Users user)
		{
			// generate token that is valid for 7 days
			var tokenHandler = new JwtSecurityTokenHandler();
			var key = Encoding.ASCII.GetBytes(_appSettings.Secret);
			var tokenDescriptor = new SecurityTokenDescriptor
			{
				Subject = new ClaimsIdentity(new[] { new Claim("id", user.Id.ToString()) }),
				Expires = DateTime.UtcNow.AddDays(7),
				SigningCredentials = new SigningCredentials(new SymmetricSecurityKey(key), SecurityAlgorithms.HmacSha256Signature)
			};
			var token = tokenHandler.CreateToken(tokenDescriptor);
			return tokenHandler.WriteToken(token);
		}

		public async Task<bool> IsExisted(string username)
		{
			string SQLQuery = $"UserName = '{username}'";
			var user = await _userRepository.GetList(SQLQuery);
			return user.Count() > 0;
		}
	}
}