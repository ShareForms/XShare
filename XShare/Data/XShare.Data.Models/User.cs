namespace XShare.Data.Models
{
    using System.Collections.Generic;
    using System.Security.Claims;
    using System.Threading.Tasks;
    using Microsoft.AspNet.Identity;
    using Microsoft.AspNet.Identity.EntityFramework;

    public class User : IdentityUser
    {

        private ICollection<Accident> accidents;
        private ICollection<Reservation> reservations;

        public User()
        {
            this.accidents = new HashSet<Accident>();
            this.reservations = new HashSet<Reservation>();
        }

        public ClaimsIdentity GenerateUserIdentity(UserManager<User> manager)
        {
            // Note the authenticationType must match the one defined in CookieAuthenticationOptions.AuthenticationType
            var userIdentity = manager.CreateIdentity(this, DefaultAuthenticationTypes.ApplicationCookie);
            // Add custom user claims here
            return userIdentity;
        }

        public Task<ClaimsIdentity> GenerateUserIdentityAsync(UserManager<User> manager)
        {
            return Task.FromResult(this.GenerateUserIdentity(manager));
        }

        public virtual ICollection<Accident> Accidents
        {
            get { return this.accidents; }
            set { this.accidents = value; }
        }

        public virtual ICollection<Reservation> Reservations
        {
            get { return this.accidents; }
            set { this.accidents = value; }
        }
    }
}
