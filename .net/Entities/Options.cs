using System;
using System.Collections.Generic;

#nullable disable

namespace WebApi.Entities
{
    public partial class Options
    {
        public int Id { get; set; }
        public string SiteUrl { get; set; }
        public string SiteName { get; set; }
        public string SiteDescription { get; set; }
        public string AdminMail { get; set; }
        public string SeoAlias { get; set; }
        public string SeoTitle { get; set; }
        public string SeoKeyword { get; set; }
        public string SeoDescription { get; set; }
        public byte? Status { get; set; }
    }
}
