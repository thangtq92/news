using System;
using System.Collections.Generic;

#nullable disable

namespace WebApi.Entities
{
    public partial class PostInTags
    {
        public int Id { get; set; }
        public int PostId { get; set; }
        public int TagId { get; set; }

  
    }
}
