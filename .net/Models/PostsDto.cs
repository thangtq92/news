using System;
using System.Collections.Generic;

#nullable disable

namespace WebApi.Entities
{
    public partial class PostsDto
    {
        public long Id { get; set; }
        public long CreateUser { get; set; }
        public byte Type { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public string Content { get; set; }
        public string Tags { get; set; }
        public string Image { get; set; }
        public string Video { get; set; }
        public DateTime? CreatedTime { get; set; }
        public DateTime? UpdateTime { get; set; }
        public long? UpdateUser { get; set; }
        public byte? Status { get; set; }
        public string Thumbnail { get; set; }
        public string SourceWeb { get; set; }
        public string SeoAlias { get; set; }
        public string SeoTitle { get; set; }
        public string SeoKeyword { get; set; }
        public string SeoDescription { get; set; }
        public int? Viewed { get; set; }
        public DateTime? HotDate { get; set; }
        public DateTime? NewDate { get; set; }
        public string Author { get; set; }
        public DateTime? PublishedDate { get; set; }
    }
}
