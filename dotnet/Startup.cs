using AutoMapper;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.OpenApi.Models;
using Swashbuckle.AspNetCore.SwaggerUI;
using System.Collections.Generic;
using System.Linq;
using WebApi.Helpers;
using WebApi.Helpers.SqlServerDB;
using WebApi.Repository;
using WebApi.Services;

namespace WebApi
{
	public class Startup
	{
		public IConfiguration Configuration { get; }

		public Startup(IConfiguration configuration)
		{
			Configuration = configuration;
		}

		// add services to the DI container
		public void ConfigureServices(IServiceCollection services)
		{
			services.AddCors();
			services.AddControllers();

			// configure strongly typed settings object
			services.Configure<AppSettings>(Configuration.GetSection("AppSettings"));
			services.Configure<SqlServerStorageConfig>(Configuration.GetSection("ConnectionStrings"));
			services.AddSingleton<SqlServerStorage>();

			// configure DI for application services
			services.AddScoped<IUserService, UserService>();
			services.AddScoped<IUserRepository, UserRepository>();

			services.AddScoped<IAdvertisementPositionService, AdvertisementPositionService>();
			services.AddScoped<IAdvertisementPositionRepository, AdvertisementPositionRepository>();

			services.AddScoped<IAdvertisementService, AdvertisementService>();
			services.AddScoped<IAdvertisementRepository, AdvertisementRepository>();

			services.AddScoped<ICategoryService, CategoryService>();
			services.AddScoped<ICategoryRepository, CategoryRepository>();

			services.AddScoped<ICommentService, CommentService>();
			services.AddScoped<ICommentRepository, CommentRepository>();

			services.AddScoped<IMenuService, MenuService>();
			services.AddScoped<IMenuRepository, MenuRepository>();

			services.AddScoped<IOptionService, OptionService>();
			services.AddScoped<IOptionRepository, OptionRepository>();

			services.AddScoped<IPageService, PageService>();
			services.AddScoped<IPageRepository, PageRepository>();

			services.AddScoped<IPageStaticService, PageStaticService>();
			services.AddScoped<IPageStaticRepository, PageStaticRepository>();

			services.AddScoped<IPostInCategoryService, PostInCategoryService>();
			services.AddScoped<IPostInCategoryRepository, PostInCategoryRepository>();

			services.AddScoped<IPostInTagService, PostInTagService>();
			services.AddScoped<IPostInTagRepository, PostInTagRepository>();

			services.AddScoped<IPostRelationService, PostRelationService>();
			services.AddScoped<IPostRelationRepository, PostRelationRepository>();

			services.AddScoped<IPostService, PostService>();
			services.AddScoped<IPostRepository, PostRepository>();

			services.AddScoped<ISystermCodeService, SystermCodeService>();
			services.AddScoped<ISystermCodeRepository, SystermCodeRepository>();

			services.AddScoped<ITagService, TagService>();
			services.AddScoped<ITagRepository, TagRepository>();

			services.AddSwaggerGen(c =>
			{
				//set API Name
				c.SwaggerDoc("v1", new OpenApiInfo
				{
					Title = "API Salary version v1",
					Version = "v1",
					Description = $"Group api"
				});

				//c.DocumentFilter<SwaggerEnumDocumentFilter>();

				//Add description JWT Bearer on API documents
				c.AddSecurityDefinition("Bearer", new OpenApiSecurityScheme
				{
					Description = "Please enter JWT with Bearer into field.\n Example: \"Authorization: Bearer {token}\"",
					Name = "Authorization",
					In = ParameterLocation.Header,
					Type = SecuritySchemeType.ApiKey,
					Scheme = "Bearer"
				});

				//Add bearer security on header when API check each one request of client
				c.AddSecurityRequirement(new OpenApiSecurityRequirement
				{
					{
						new OpenApiSecurityScheme
						{
							Reference = new OpenApiReference
							{
								Type = ReferenceType.SecurityScheme,
								Id = "Bearer"
							}
						},
						new string[] { }
					}
				});
				//c.EnableAnnotations();
				//c.CustomOperationIds((obj) => obj.GetHashCode().ToString());

				#region Hide parameter on functions when user unauthenticated
				//c.DocInclusionPredicate((docName, apiDesc) =>
				//{
				//    if (apiDesc.GroupName == docName)
				//    {
				//        return true;
				//    }
				//    return false;s
				//});
				#endregion

			});
			var autoFacConfig = new MapperConfiguration(mc => { mc.AddProfile(new MappingProfile()); });
			autoFacConfig.AssertConfigurationIsValid();
			services.AddSingleton(autoFacConfig.CreateMapper());
		}

		// configure the HTTP request pipeline
		public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
		{
			app.UseSwagger();
			app.UseSwaggerUI(c =>
			{
				c.SwaggerEndpoint("/swagger/v1/swagger.json", "v1");
				//c.DocExpansion(DocExpansion.None);
				//c.DisplayRequestDuration();
				//c.EnableDeepLinking();
			});

			app.UseRouting();

			// global cors policy
			app.UseCors(x => x
				.AllowAnyOrigin()
				.AllowAnyMethod()
				.AllowAnyHeader());

			// custom jwt auth middleware
			app.UseMiddleware<JwtMiddleware>();

			app.UseEndpoints(x => x.MapControllers());
		}

	}
}