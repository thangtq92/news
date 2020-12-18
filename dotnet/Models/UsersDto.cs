using System;
using System.Collections.Generic;
using System.Text.Json.Serialization;

#nullable disable

namespace WebApi.Entities
{
    public partial class UsersDto
    {
        public int Id { get; set; }
        public string UserName { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public string Password { get; set; }
        public string Avatar { get; set; }
        public byte? Type { get; set; }
        public DateTime CreatedTime { get; set; }
        public long CreatedUser { get; set; }
        public DateTime? UpdateTime { get; set; }
        public long? UpdateUser { get; set; }
        public byte? Status { get; set; }
    }
}
