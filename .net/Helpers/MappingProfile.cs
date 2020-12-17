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

			CreateMap<AdvertisementPositions, AdvertisementPositionsDto>().ForMember(x => x.Page, opt => opt.Ignore()).ForMember(x => x.Advertisements, opt => opt.Ignore());
			CreateMap<AdvertisementPositionsDto, AdvertisementPositions>();

			CreateMap<Advertisements, AdvertisementsDto>().ForMember(x => x.Page, opt => opt.Ignore()).ForMember(x => x.Position, opt => opt.Ignore());
			CreateMap<AdvertisementsDto, Advertisements>();

			CreateMap<Categories, CategoriesDto>().ForMember(x => x.PostInCategories, opt => opt.Ignore());
			CreateMap<CategoriesDto, Categories>(); 

			CreateMap<Comments, CommentsDto>().ForMember(x => x.Post, opt => opt.Ignore());
			CreateMap<CommentsDto, Comments>(); 

			CreateMap<Menus, MenusDto>();
			CreateMap<MenusDto, Menus>();

			CreateMap<Options, OptionsDto>();
			CreateMap<OptionsDto, Options>();

			CreateMap<Pages, PagesDto>().ForMember(x => x.AdvertisementPositions, opt => opt.Ignore()).ForMember(x => x.Advertisements, opt => opt.Ignore());
			CreateMap<PagesDto, Pages>();

			CreateMap<PageStatics, PageStaticsDto>();
			CreateMap<PageStaticsDto, PageStatics>();

			CreateMap<PostInCategories, PostInCategoriesDto>().ForMember(x => x.Category, opt => opt.Ignore());
			CreateMap<PostInCategoriesDto, PostInCategories>();

			CreateMap<PostInTags, PostInTagsDto>().ForMember(x => x.Post, opt => opt.Ignore()).ForMember(x => x.Tags, opt => opt.Ignore());
			CreateMap<PostInTagsDto, PostInTags>();

			CreateMap<PostRelations, PostRelationsDto>();
			CreateMap<PostRelationsDto, PostRelations>();

			CreateMap<Posts, PostsDto>().ForMember(x => x.Comments, opt => opt.Ignore()).ForMember(x => x.PostInTags, opt => opt.Ignore());
			CreateMap<PostsDto, Posts>();

			CreateMap<SystermCodes, SystermCodesDto>();
			CreateMap<SystermCodesDto, SystermCodes>();

			CreateMap<Tags, TagsDto>().ForMember(x => x.PostInTags, opt => opt.Ignore());
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
