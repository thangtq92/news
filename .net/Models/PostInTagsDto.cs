using System;
using System.Collections.Generic;

#nullable disable

namespace WebApi.Entities
{
    public partial class PostInTagsDto
    {
        public int PostId { get; set; }
        public int TagsId { get; set; }

    }
}
