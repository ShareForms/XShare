namespace XShare.WebForms.DataTransferModels
{
    using System;
    using System.Linq;
    using System.Linq.Expressions;
    using XShare.Data.Models;

    public class UserAdminPanelModel
    {
        public static Expression<Func<User, UserAdminPanelModel>> FromUser
        {
            get
            {
                return u => new UserAdminPanelModel()
                {
                    Id = u.Id,
                    Email = u.Email,
                    UserName = u.UserName,
                    PhoneNumber = u.PhoneNumber,
                    IsAdmin = u.Roles.Any(),
                    ReservationsCount = u.Reservations.Count(),
                    AccidentsCount = u.Accidents.Count(),
                    LoginsCount = u.Logins.Count()
                };
            }
        }

        public string Id { get; set; }

        public string UserName { get; set; }

        public string Email { get; set; }

        public string PhoneNumber { get; set; }

        public bool IsAdmin { get; set; }

        public int ReservationsCount { get; set; }

        public int AccidentsCount { get; set; }

        public int LoginsCount { get; set; }
    }
}