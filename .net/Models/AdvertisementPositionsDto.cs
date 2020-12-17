using System;
using System.Collections.Generic;

#nullable disable

namespace WebApi.Entities
{
	public partial class AdvertisementPositionsDto
	{
		public AdvertisementPositionsDto()
		{
			Advertisements = new HashSet<Advertisements>();
		}
		public int Id { get; set; }
		public string Code { get; set; }
		public string Name { get; set; }
		public int? PageId { get; set; }
		public virtual Pages Page { get; set; }
		public virtual ICollection<Advertisements> Advertisements { get; set; }
	}
}
