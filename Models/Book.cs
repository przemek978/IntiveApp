using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

namespace IntiveApp.Models;

public partial class Book
{
    public int Id { get; set; }

    public string Title { get; set; }

    public string Description { get; set; } = null!;

    public decimal Rating { get; set; }

    public string Isbn { get; set; } = null!;

    public DateTime PublicationDate { get; set; }

    public virtual List<BookAuthor> Authors { get; set; } = new List<BookAuthor>();
}
