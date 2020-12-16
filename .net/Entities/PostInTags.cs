using System;
using System.Collections.Generic;

#nullable disable

namespace WebApi.Entities
{
    public partial class PostInTags
    {
        public long Id { get; set; }
        public long TagsId { get; set; }
        public long PostId { get; set; }
    }
}
