namespace XShare.WebForms.Admin
{
    using System;
    using System.Linq;
    using System.Web.UI.WebControls;
    using Microsoft.AspNet.Identity;
    using Microsoft.AspNet.Identity.EntityFramework;
    using Ninject;
    using XShare.Common.Extensions;
    using XShare.Data;
    using XShare.Data.Models;
    using XShare.Services.Data.Contracts;
    using XShare.WebForms.Controls.Notificator;

    public partial class ManageUsers : System.Web.UI.Page
    {

        [Inject]
        public IUserService UsersService { get; set; }


        protected void Page_Load(object sender, EventArgs e)
        {
        }

        public void ListViewUsers_DeleteItem(string Id)
        {
            this.UsersService.DeleteById(Id);
        }

        public void ListViewUsers_UpdateItem(string Id, string commandArgument)
        {
            var item = this.UsersService.GetById(Id);

            if (item == null)
            {
                var errorMessage = $"User with id {this.ID} was not found";
                Notificator.AddErrorMessage(errorMessage);

                this.ModelState.AddModelError("", errorMessage);
                return;
            }
            
            var isAdmin = ((CheckBox)ListViewAllUsers.Items[ListViewAllUsers.EditIndex].FindControl("CbIsADmin")).Checked;

            // TODO: extract in separate class or service
            var userManager = new UserManager<User>(new UserStore<User>(new XShareDbContext()));

            if (isAdmin)
            {
                userManager.AddToRole(item.Id, "admin");
            }
            else
            {
                userManager.RemoveFromRole(item.Id, "admin");
            }

            this.TryUpdateModel(item);
            if (this.ModelState.IsValid)
            {
                this.UsersService.UpdateUser(item);
            }
        }

        public IQueryable<User> ListViewAllUsers_GetData(string sortByExpression)
        {
            string id = this.TB_FiltreID.Text;
            string user = this.TB_FiltreUserName.Text;
            string email = this.TB_FilterEmail.Text;
            string phone = this.TB_FiltrePhoneNumber.Text;

            var usersQuery = this.UsersService.GetFiltered(id, user, email, phone);

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

        protected void OnFilterClick(object sender, EventArgs e)
        {
            this.ListViewAllUsers.DataBind();
        }

        protected void OnClearFIltersClick(object sender, EventArgs e)
        {
            this.TB_FiltreID.Text = null;
            this.TB_FiltreUserName.Text = null;
            this.TB_FilterEmail.Text = null;
            this.TB_FiltrePhoneNumber.Text = null;

            this.ListViewAllUsers.DataBind();
        }
    }
}
