﻿using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace IntiveApp.Models;

public partial class IntiveContext : DbContext
{
    public IntiveContext()
    {
    }

    public IntiveContext(DbContextOptions<IntiveContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Author> Authors { get; set; }

    public virtual DbSet<Book> Books { get; set; }

    public virtual DbSet<BookAuthor> BookAuthors { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        => optionsBuilder.UseSqlServer("Data Source=DESKTOP-IEHQTFA;Initial Catalog=Intive;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Author>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Author__3214EC07FFD3A528");

            entity.ToTable("Author");
            //entity.HasMany(e => e.BookAuthors)
            //    .WithOne(a => a.Author)
            //    .HasForeignKey(e=>e.AuthorId);
            entity.Property(e => e.Id).ValueGeneratedNever();
            entity.Property(e => e.FirstName).HasMaxLength(50);
            entity.Property(e => e.LastName).HasMaxLength(50);
        });

        modelBuilder.Entity<Book>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Book__3214EC07ED3B0FFF");

            entity.ToTable("Book");
            //entity.HasMany(e => e.BookAuthors)
            //    .WithOne(a => a.Book)
            //    .HasForeignKey(e => e.BookId);
            entity.Property(e => e.Id).ValueGeneratedNever();
            entity.Property(e => e.Isbn)
                .HasMaxLength(13)
                .HasColumnName("ISBN");
            entity.Property(e => e.Rating).HasColumnType("decimal(18, 0)");
            entity.Property(e => e.Title).HasMaxLength(100);

        });


        modelBuilder.Entity<BookAuthor>(entity =>
        {
            //entity.HasKey(e => e.BookId).HasName("PK__BookAuth__3DE0C2073DDCE76B");

            entity.ToTable("BookAuthor");

            entity.Property(e => e.BookId).ValueGeneratedNever();

            entity.HasKey(e => new { e.BookId, e.AuthorId });
            entity.HasOne<Author>(d => d.Author).WithMany(p => p.Books)
                .HasForeignKey(d => d.AuthorId).IsRequired()
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("author_fk");

            entity.HasOne<Book>(d => d.Book).WithMany(p => p.Authors)
                .HasForeignKey(d => d.BookId).IsRequired()
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("book_fk");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
