﻿using System;
using System.Collections.Generic;

#nullable disable

namespace WebApi.Entities
{
    public partial class SystermCodes
    {
        public int Id { get; set; }
        public string Type { get; set; }
        public string Value { get; set; }
        public string Text { get; set; }
        public string Note { get; set; }
        public byte? Status { get; set; }
    }
}
