using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

namespace IntiveApp.Models;

public partial class Author
{
    public int Id { get; set; }

    public string FirstName { get; set; } = null!;

    public string LastName { get; set; }

    public DateTime BirthDate { get; set; }

    public bool Gender { get; set; }
    public virtual List<BookAuthor> Books { get; set; } = new List<BookAuthor>();
}
