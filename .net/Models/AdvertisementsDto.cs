using System;
using System.Collections.Generic;

#nullable disable

namespace WebApi.Entities
{
    public partial class AdvertisementsDto
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public int? PositionId { get; set; }
        public int? PageId { get; set; }
        public string Image { get; set; }
        public string Video { get; set; }
        public int? Width { get; set; }
        public int? Height { get; set; }
        public int? ClickCount { get; set; }
        public DateTime? FromDate { get; set; }
        public DateTime? ToDate { get; set; }
        public byte? Status { get; set; }
        public virtual Pages Page { get; set; }
        public virtual AdvertisementPositions Position { get; set; }
    }
}
