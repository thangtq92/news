using System;
using System.Collections.Generic;

#nullable disable

namespace WebApi.Entities
{
	public partial class PostsDto
	{
		public PostsDto()
		{
			Comments = new HashSet<Comments>();
			PostInTags = new HashSet<PostInTags>();
		}

		public int Id { get; set; }
		public string Title { get; set; }
		public string Description { get; set; }
		public string Content { get; set; }
		public string Thumbnail { get; set; }
		public string Image { get; set; }
		public string Video { get; set; }
		public string SourceWeb { get; set; }
		public byte? Status { get; set; }
		public string SeoAlias { get; set; }
		public string SeoTitle { get; set; }
		public string SeoKeyword { get; set; }
		public string SeoDescription { get; set; }
		public int? Viewed { get; set; }
		public DateTime? HotDate { get; set; }
		public DateTime? NewDate { get; set; }
		public string Author { get; set; }
		public int? CreatedUser { get; set; }
		public int? UpdatedUser { get; set; }
		public DateTime? CreatedDate { get; set; }
		public DateTime? UpdateDate { get; set; }
		public DateTime? PublishedDate { get; set; }
		public byte? Type { get; set; }
		public virtual ICollection<Comments> Comments { get; set; }
		public virtual ICollection<PostInTags> PostInTags { get; set; }
		public List<int> categoryIds { get; set; }
		public List<int> tagIds { get; set; }
	}
}
