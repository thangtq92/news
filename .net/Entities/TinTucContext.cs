using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

#nullable disable

namespace WebApi.Entities
{
    public partial class TintucContext : DbContext
    {
        public TintucContext()
        {
        }

        public TintucContext(DbContextOptions<TintucContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Advertisements> Advertisements { get; set; }
        public virtual DbSet<AdvertisementPositions> AdvertisementPositions { get; set; }
        public virtual DbSet<Categories> Categories { get; set; }
        public virtual DbSet<Comments> Comments { get; set; }
        public virtual DbSet<MenusDto> Menus { get; set; }
        public virtual DbSet<Options> Options { get; set; }
        public virtual DbSet<Pages> Pages { get; set; }
        public virtual DbSet<PageStatics> PageStatics { get; set; }
        public virtual DbSet<Posts> Posts { get; set; }
        public virtual DbSet<PostInCategories> PostInCategories { get; set; }
        public virtual DbSet<PostInTags> PostInTags { get; set; }
        public virtual DbSet<PostRelations> PostRelations { get; set; }
        public virtual DbSet<SystermCodes> SystermCodes { get; set; }
        public virtual DbSet<Tags> Tags { get; set; }
        public virtual DbSet<Users> Users { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                optionsBuilder.UseSqlServer("Server=./;Database=Tintuc;Trusted_Connection=True;");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasAnnotation("Relational:Collation", "SQL_Latin1_General_CP1_CI_AS");

            modelBuilder.Entity<Advertisements>(entity =>
            {
                entity.Property(e => e.FromDate).HasColumnType("datetime");

                entity.Property(e => e.Image).HasMaxLength(250);

                entity.Property(e => e.Name).HasMaxLength(250);

                entity.Property(e => e.ToDate).HasColumnType("datetime");

                entity.Property(e => e.Video).HasMaxLength(250);
            });

            modelBuilder.Entity<AdvertisementPositions>(entity =>
            {
                entity.Property(e => e.Code)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.Name).HasMaxLength(250);
            });

            modelBuilder.Entity<Categories>(entity =>
            {
                entity.Property(e => e.Name).HasMaxLength(250);

                entity.Property(e => e.SeoAlias).HasMaxLength(250);

                entity.Property(e => e.SeoDescription).HasMaxLength(250);

                entity.Property(e => e.SeoKeyword).HasMaxLength(250);

                entity.Property(e => e.SeoTitle).HasMaxLength(250);
            });

            modelBuilder.Entity<Comments>(entity =>
            {
                entity.Property(e => e.CreatedTime)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.Email).HasMaxLength(50);

                entity.Property(e => e.Name).HasMaxLength(50);

                entity.Property(e => e.Phone)
                    .HasMaxLength(20)
                    .IsUnicode(false);

                entity.Property(e => e.Repost)
                    .HasMaxLength(10)
                    .IsFixedLength(true);

                entity.Property(e => e.UpdateTime).HasColumnType("datetime");
            });

            modelBuilder.Entity<MenusDto>(entity =>
            {
                entity.Property(e => e.CssClass).HasMaxLength(250);

                entity.Property(e => e.CssIcon).HasMaxLength(250);

                entity.Property(e => e.Name)
                    .HasMaxLength(250)
                    .IsUnicode(false);

                entity.Property(e => e.Url)
                    .HasMaxLength(250)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<Options>(entity =>
            {
                entity.Property(e => e.AdminMail)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.SeoAlias).HasMaxLength(250);

                entity.Property(e => e.SeoDescription).HasMaxLength(250);

                entity.Property(e => e.SeoKeyword).HasMaxLength(250);

                entity.Property(e => e.SeoTitle).HasMaxLength(250);

                entity.Property(e => e.SiteDescription).HasMaxLength(500);

                entity.Property(e => e.SiteName).HasMaxLength(250);

                entity.Property(e => e.SiteUrl)
                    .HasMaxLength(50)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<Pages>(entity =>
            {
                entity.Property(e => e.Code)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.SeoAlias).HasMaxLength(250);

                entity.Property(e => e.SeoDescription).HasMaxLength(250);

                entity.Property(e => e.SeoKeyword).HasMaxLength(250);

                entity.Property(e => e.SeoTitle).HasMaxLength(250);

                entity.Property(e => e.Title).HasMaxLength(250);
            });

            modelBuilder.Entity<PageStatics>(entity =>
            {
                entity.Property(e => e.SeoAlias).HasMaxLength(250);

                entity.Property(e => e.SeoDescription).HasMaxLength(250);

                entity.Property(e => e.SeoKeyword).HasMaxLength(250);

                entity.Property(e => e.SeoTitle).HasMaxLength(250);

                entity.Property(e => e.Title).HasMaxLength(250);
            });

            modelBuilder.Entity<Posts>(entity =>
            {
                entity.Property(e => e.Author).HasMaxLength(250);

                entity.Property(e => e.CreatedTime)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.Description).HasMaxLength(500);

                entity.Property(e => e.HotDate).HasColumnType("datetime");

                entity.Property(e => e.NewDate).HasColumnType("datetime");

                entity.Property(e => e.PublishedDate).HasColumnType("datetime");

                entity.Property(e => e.SeoAlias).HasMaxLength(250);

                entity.Property(e => e.SeoDescription).HasMaxLength(250);

                entity.Property(e => e.SeoKeyword).HasMaxLength(250);

                entity.Property(e => e.SeoTitle).HasMaxLength(250);

                entity.Property(e => e.SourceWeb).HasMaxLength(250);

                entity.Property(e => e.Thumbnail).HasMaxLength(250);

                entity.Property(e => e.Title)
                    .IsRequired()
                    .HasMaxLength(250);

                entity.Property(e => e.UpdateTime)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");
            });

            modelBuilder.Entity<PostRelations>(entity =>
            {
                entity.Property(e => e.Description).HasMaxLength(500);

                entity.Property(e => e.Thumbnail).HasMaxLength(250);

                entity.Property(e => e.Title).HasMaxLength(250);

                entity.Property(e => e.Url).HasMaxLength(250);
            });

            modelBuilder.Entity<SystermCodes>(entity =>
            {
                entity.Property(e => e.Text).HasMaxLength(500);

                entity.Property(e => e.Type).HasMaxLength(50);

                entity.Property(e => e.Value).HasMaxLength(50);
            });

            modelBuilder.Entity<Tags>(entity =>
            {
                entity.Property(e => e.Name).HasMaxLength(500);

                entity.Property(e => e.SeoAlias).HasMaxLength(250);

                entity.Property(e => e.SeoDescription).HasMaxLength(250);

                entity.Property(e => e.SeoKeyword).HasMaxLength(250);

                entity.Property(e => e.SeoTitle).HasMaxLength(250);

                entity.Property(e => e.Slug).HasMaxLength(250);
            });

            modelBuilder.Entity<Users>(entity =>
            {
                entity.Property(e => e.CreatedTime)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.Email).HasMaxLength(50);

                entity.Property(e => e.FirstName).HasMaxLength(50);

                entity.Property(e => e.LastName).HasMaxLength(50);

                entity.Property(e => e.Password)
                    .IsRequired()
                    .HasMaxLength(50)
                    .IsFixedLength(true);

                entity.Property(e => e.Phone).HasMaxLength(20);

                entity.Property(e => e.UpdateTime)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.UserName)
                    .HasMaxLength(50)
                    .IsFixedLength(true);
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
