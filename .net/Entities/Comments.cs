using System;
using System.Collections.Generic;

#nullable disable

namespace WebApi.Entities
{
    public partial class Comments
    {
        public long Id { get; set; }
        public string Content { get; set; }
        public byte? Type { get; set; }
        public long? TargetId { get; set; }
        public byte? Status { get; set; }
        public DateTime CreatedTime { get; set; }
        public long CreatedUser { get; set; }
        public DateTime? UpdateTime { get; set; }
        public long? UpdateUser { get; set; }
        public string Name { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public string Repost { get; set; }
        public long? PostId { get; set; }
    }
}
