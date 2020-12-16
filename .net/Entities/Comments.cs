using System;
using System.Collections.Generic;

#nullable disable

namespace WebApi.Entities
{
    public partial class Comments
    {
        public long Id { get; set; }
        public string Content { get; set; }
        public string Name { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public byte? Status { get; set; }
        public string Report { get; set; }
        public DateTime CreatedDate { get; set; }
        public int CreatedUser { get; set; }
        public int? PostId { get; set; }

        public virtual Posts Post { get; set; }
    }
}
