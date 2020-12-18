using System;
using System.Collections.Generic;

#nullable disable

namespace WebApi.Entities
{
    public partial class PostRelations
    {
        public int Id { get; set; }
        public string Title { get; set; }
        public string Thumbnail { get; set; }
        public string Description { get; set; }
        public string Url { get; set; }
        public int? PostId { get; set; }
        public int? PostRelationId { get; set; }
        public bool? Status { get; set; }
    }
}
