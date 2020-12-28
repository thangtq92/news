using System;
using System.Collections.Generic;

#nullable disable

namespace WebApi.Entities
{
    public partial class PostInCategoriesDto
    {
        public int Id { get; set; }
        public int PostId { get; set; }
        public int CategoryId { get; set; }
        public virtual Categories Category { get; set; }
    }
}
