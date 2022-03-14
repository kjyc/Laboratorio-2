namespace Domain
{
    public class User
    {
        public string Email { get; }
        public string Name { get; }
        public string Lastname { get; }
        public string Role { get; }
        public bool IsConfirmed { get; }
        private string Password;

        public User(string email, string name, string lastname, string role, string password, bool confirmed)
        {
            Email = email;
            Name = name;
            Lastname = lastname;
            Role = role;
            IsConfirmed = confirmed;
            Password = password;
        }

        public bool IsCorrectPassword(string password)
        {
            if (Password == password)
            {
                return true;
            }
            return false;
        }

    }
}
