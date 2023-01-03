﻿using System;
using System.Collections.Generic;

namespace IntiveApp.Models;

public partial class BookAuthor
{
    public int BookId { get; set; }

    public int AuthorId { get; set; }

    public virtual Author Author { get; set; } = null!;

    public virtual Book Book { get; set; } = null!;
}
