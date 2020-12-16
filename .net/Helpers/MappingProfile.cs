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
			CreateMap<AdvertisementPositionsDto, AdvertisementPositions>().ForMember(x => x.Page, opt => opt.Ignore()).ForMember(x => x.Advertisements, opt => opt.Ignore()) ;

			CreateMap<Advertisements, AdvertisementsDto>();
			CreateMap<AdvertisementsDto, Advertisements>().ForMember(x => x.Page, opt => opt.Ignore()).ForMember(x => x.Position, opt => opt.Ignore());

			CreateMap<Categories, CategoriesDto>();
			CreateMap<CategoriesDto, Categories>().ForMember(x => x.PostInCategories, opt => opt.Ignore()); 

			CreateMap<Comments, CommentsDto>();
			CreateMap<CommentsDto, Comments>().ForMember(x => x.Post, opt => opt.Ignore()); 

			CreateMap<Menus, MenusDto>();
			CreateMap<MenusDto, Menus>();

			CreateMap<Options, OptionsDto>();
			CreateMap<OptionsDto, Options>();

			CreateMap<Pages, PagesDto>();
			CreateMap<PagesDto, Pages>().ForMember(x => x.AdvertisementPositions, opt => opt.Ignore()).ForMember(x => x.Advertisements, opt => opt.Ignore());

			CreateMap<PageStatics, PageStaticsDto>();
			CreateMap<PageStaticsDto, PageStatics>();

			CreateMap<PostInCategories, PostInCategoriesDto>();
			CreateMap<PostInCategoriesDto, PostInCategories>().ForMember(x => x.Category, opt => opt.Ignore());

			CreateMap<PostInTags, PostInTagsDto>();
			CreateMap<PostInTagsDto, PostInTags>().ForMember(x => x.Post, opt => opt.Ignore()).ForMember(x => x.Tags, opt => opt.Ignore());

			CreateMap<PostRelations, PostRelationsDto>();
			CreateMap<PostRelationsDto, PostRelations>();

			CreateMap<Posts, PostsDto>();
			CreateMap<PostsDto, Posts>().ForMember(x => x.Comments, opt => opt.Ignore()).ForMember(x => x.PostInTags, opt => opt.Ignore());

			CreateMap<SystermCodes, SystermCodesDto>();
			CreateMap<SystermCodesDto, SystermCodes>();

			CreateMap<Tags, TagsDto>();
			CreateMap<TagsDto, Tags>().ForMember(x => x.PostInTags, opt => opt.Ignore());
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
