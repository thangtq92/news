using System;
using System.Collections.Generic;

#nullable disable

namespace WebApi.Entities
{
    public partial class PostInTagsDto
    {
        public int PostId { get; set; }
        public int TagId { get; set; }
        public virtual Posts Post { get; set; }
        public virtual Tags Tags { get; set; }

    }
}
