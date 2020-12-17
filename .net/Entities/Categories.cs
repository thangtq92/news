using System;
using System.Collections.Generic;

#nullable disable

namespace WebApi.Entities
{
    public partial class Categories
    {
      

        public int Id { get; set; }
        public string Name { get; set; }
        public string Content { get; set; }
        public int ParentId { get; set; }
        public int? SortOrder { get; set; }
        public string SeoAlias { get; set; }
        public string SeoTitle { get; set; }
        public string SeoKeyword { get; set; }
        public string SeoDescription { get; set; }
        public bool? ShowInHome { get; set; }
        public bool? ShowInMenu { get; set; }
        public byte? Status { get; set; }

      
    }
}
