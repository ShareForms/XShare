namespace XShare.WebForms.Clients
{
    using System;
    using System.Linq;
    using Data.Models;
    using Ninject;
    using Services.Data.Contracts;
    using XShare.Common.Extensions;

    public partial class All : System.Web.UI.Page
    {
        [Inject]
        public IUserService UserService { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public IQueryable<User> GridViewAll_GetUserData(string sortByExpression)
        {
            var usersQuery = this.UserService.GetAll()
                                .Where(u => !u.Roles.Any());

            if (sortByExpression != null)
            {
                if (sortByExpression.EndsWith(" DESC"))
                {
                    usersQuery = usersQuery
                        .OrderByDescending(sortByExpression.Substring(0, sortByExpression.Length - 5));
                }
                else
                {
                    usersQuery = usersQuery
                        .OrderBy(sortByExpression);
                }
            }

            return usersQuery;
        }
    }
}