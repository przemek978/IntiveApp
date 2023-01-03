namespace IntiveApp.Models
{
    public class Author
    {
        public int Id { get; set; }
        public string FirstName { get; set; }
        public int LastName { get; set; }
        public DateTime BirthDate { get; set; }
        public Boolean Gender { get; set; }
        public ICollection<BookAuthor> AuthorBooks { get; set; }
    }
}
