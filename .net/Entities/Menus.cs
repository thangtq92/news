using System;
using System.Collections.Generic;

#nullable disable

namespace WebApi.Entities
{
    public partial class Menus
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Url { get; set; }
        public string CssIcon { get; set; }
        public string CssClass { get; set; }
        public int? ParentId { get; set; }
        public byte? Type { get; set; }
        public byte? Status { get; set; }
    }
}
