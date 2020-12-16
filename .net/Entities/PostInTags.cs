using System;
using System.Collections.Generic;

#nullable disable

namespace WebApi.Entities
{
    public partial class PostInTags
    {
        public int PostId { get; set; }
        public int TagsId { get; set; }

        public virtual Posts Post { get; set; }
        public virtual Tags Tags { get; set; }
    }
}
