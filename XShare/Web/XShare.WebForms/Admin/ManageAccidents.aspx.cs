namespace XShare.WebForms.Admin
{
    using System;
    using System.Linq;
    using System.Web.UI.WebControls;
    using Ninject;
    using XShare.Common.Extensions;
    using XShare.Data.Models;
    using XShare.Services.Data.Contracts;

    public partial class ManageAccidents : System.Web.UI.Page
    {
        [InjectAttribute]
        public IAccidentService AccidentService { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        public void ListViewAccidents_DeleteItem(int Id)
        {
            this.AccidentService.DeleteById(Id);
        }

        public void ListViewAccidents_UpdateItem(int Id)
        {
            var item = this.AccidentService.GetById(Id);

            if (item == null)
            {
                this.ModelState.AddModelError("", $"Item with id {this.ID} was not found");
                return;
            }

            this.TryUpdateModel(item);
            if (this.ModelState.IsValid)
            {
                this.AccidentService.UpadteAccident(item);
            }
        }

        public IQueryable<Accident> ListViewAll_GetData(string sortByExpression)
        {
            int? id = this.TB_FiltreById.Text != ""
                ? (int?)int.Parse(this.TB_FiltreById.Text)
                : default(int?);
            string userName = this.TB_FiltreByUserName.Text;
            string model = this.TB_FiltreByCarModel.Text;
            string carType = this.DDL_FilterByType.SelectedValue;
            string location = this.TB_FiltreByLocation.Text;
            string description = this.TB_FiltreDescription.Text;

            var accidentsQuery = this.AccidentService.GetFiltered(id, userName, model, carType, location, description);

            if (sortByExpression != null)
            {
                if (sortByExpression.EndsWith(" DESC"))
                {
                    accidentsQuery = accidentsQuery
                        .OrderByDescending(sortByExpression.Substring(0, sortByExpression.Length - 5));
                }
                else
                {
                    accidentsQuery = accidentsQuery
                        .OrderBy(sortByExpression);
                }
            }

            return accidentsQuery;
        }

        protected void OnFilterClick(object sender, EventArgs e)
        {
            this.ViewLastestReservations.DataBind();
        }

        protected void OnClearFIltersClick(object sender, EventArgs e)
        {
            this.TB_FiltreById.Text = null;
            this.TB_FiltreByUserName.Text = null;
            this.TB_FiltreByCarModel.Text = null;
            this.DDL_FilterByType.SelectedIndex = 0;
            this.TB_FiltreByLocation.Text = null;
            this.TB_FiltreDescription.Text = null;

            this.ViewLastestReservations.DataBind();
        }

        public IQueryable<string> GetCarType()
        {
            var carTypes = Enum.GetValues(typeof(CarTypes)).AsQueryable()
                .Cast<CarTypes>()
                .Select(x => x.ToString());
            return carTypes;
        }

        protected void DDL_FilterByType_DataBound(object sender, EventArgs e)
        {
            this.DDL_FilterByType.Items.Insert(0, new ListItem("--- filter by car type ---", String.Empty));
        }
    }
}