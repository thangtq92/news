using AutoMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WebApi.Entities;

namespace WebApi.Helpers
{
	public partial class MappingProfile : Profile
	{
		public MappingProfile()
		{
			AllowNullDestinationValues = true;

			CreateMap<Users, UsersDto>();
			CreateMap<UsersDto, Users>();

			CreateMap<AdvertisementPositions, AdvertisementPositionsDto>();
			CreateMap<AdvertisementPositionsDto, AdvertisementPositions>();

			CreateMap<Advertisements, AdvertisementsDto>();
			CreateMap<AdvertisementsDto, Advertisements>();

			CreateMap<Categories, CategoriesDto>();
			CreateMap<CategoriesDto, Categories>();

			CreateMap<Comments, CommentsDto>();
			CreateMap<CommentsDto, Comments>();

			CreateMap<Menus, MenusDto>();
			CreateMap<MenusDto, Menus>();

			CreateMap<Options, OptionsDto>();
			CreateMap<OptionsDto, Options>();

			CreateMap<Pages, PagesDto>();
			CreateMap<PagesDto, Pages>();

			CreateMap<PageStatics, PageStaticsDto>();
			CreateMap<PageStaticsDto, PageStatics>();

			CreateMap<PostInCategories, PostInCategoriesDto>();
			CreateMap<PostInCategoriesDto, PostInCategories>();

			CreateMap<PostInTags, PostInTagsDto>();
			CreateMap<PostInTagsDto, PostInTags>();

			CreateMap<PostRelations, PostRelationsDto>();
			CreateMap<PostRelationsDto, PostRelations>();

			CreateMap<Posts, PostsDto>();
			CreateMap<PostsDto, Posts>();

			CreateMap<SystermCodes, SystermCodesDto>();
			CreateMap<SystermCodesDto, SystermCodes>();

			CreateMap<Tags, TagsDto>();
			CreateMap<TagsDto, Tags>();
		}
	}

	public class AutoMapperConfiguration
	{
		public static List<Profile> RegisterMappings()
		{
			return new List<Profile> { new MappingProfile() };
		}
	}
}
