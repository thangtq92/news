﻿using System;
using System.Collections.Generic;

#nullable disable

namespace WebApi.Entities
{
    public partial class PostInCategoriesDto
    {
        public long Id { get; set; }
        public long? PostId { get; set; }
        public int? CategoryId { get; set; }
    }
}
