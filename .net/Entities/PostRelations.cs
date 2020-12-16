using System;
using System.Collections.Generic;

#nullable disable

namespace WebApi.Entities
{
    public partial class PostRelations
    {
        public long Id { get; set; }
        public string Title { get; set; }
        public string Thumbnail { get; set; }
        public string Description { get; set; }
        public string Url { get; set; }
        public long? PostId { get; set; }
        public long? PostRelationId { get; set; }
        public bool? Status { get; set; }
    }
}
