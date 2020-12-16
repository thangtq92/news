using System;
using System.Collections.Generic;

#nullable disable

namespace WebApi.Entities
{
    public partial class PagesDto
    {
        public int Id { get; set; }
        public string Code { get; set; }
        public string Title { get; set; }
        public string Content { get; set; }
        public string SeoAlias { get; set; }
        public string SeoTitle { get; set; }
        public string SeoKeyword { get; set; }
        public string SeoDescription { get; set; }
        public byte? Status { get; set; }
    }
}
