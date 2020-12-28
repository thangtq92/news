using System;
using System.Collections.Generic;

#nullable disable

namespace WebApi.Entities
{
    public partial class PostInCategories
    {
        public int Id { get; set; }
        public int PostId { get; set; }
        public int CategoryId { get; set; }

       
    }
}
