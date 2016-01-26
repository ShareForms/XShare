using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace XShare.WebForms.Admin
{
    using Ninject;
    using XShare.Common.Extensions;
    using XShare.Data.Models;
    using XShare.Services.Data.Contracts;
    using XShare.WebForms.Controls.Notificator;

    public partial class ManageCars : System.Web.UI.Page
    {
        [Inject]
        public ICarService CarService { get; set; }

        [Inject]
        public IFeaturesService FeatureService { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        public void ListViewCar_DeleteItem(int Id)
        {
            this.CarService.DeleteById(Id);
        }

        public void ListViewCar_UpdateItem(int Id)
        {
            var item = this.CarService.CarById(Id);

            if (item == null)
            {
                var errorMessage = $"Item with id {this.ID} was not found";
                Notificator.AddErrorMessage(errorMessage);

                this.ModelState.AddModelError("", errorMessage);
                return;
            }

            this.TryUpdateModel(item);
            if (this.ModelState.IsValid)
            {
                this.CarService.UpdateCar(item);
            }
        }

        public IQueryable<Car> ListViewAllCars_GetData(string sortByExpression)
        {
            string model = this.TB_FiltreModel.Text;
            string type = this.DDL_FilterByType.Text;
            int? fuelEco = this.TB_FiltreFuelEconomy.Text != ""
                ? (int?)int.Parse(this.TB_FiltreFuelEconomy.Text)
                : default(int?);

            var reservationsQuery = this.CarService.GetFiltered(model, type, fuelEco);

            if (sortByExpression != null)
            {
                if (sortByExpression.EndsWith(" DESC"))
                {
                    reservationsQuery = reservationsQuery
                        .OrderByDescending(sortByExpression.Substring(0, sortByExpression.Length - 5));
                }
                else
                {
                    reservationsQuery = reservationsQuery
                        .OrderBy(sortByExpression);
                }
            }

            return reservationsQuery;
        }

        protected void OnFilterClick(object sender, EventArgs e)
        {
            this.ListViewAllCars.DataBind();
        }

        protected void OnClearFIltersClick(object sender, EventArgs e)
        {
            this.TB_FiltreModel.Text = null;
            this.DDL_FilterByType.Text = null;
            this.TB_FiltreFuelEconomy.Text = null;

            this.ListViewAllCars.DataBind();
        }

        public IQueryable<string> GetCarType()
        {
            var carTypes = Enum.GetValues(typeof(CarTypes)).AsQueryable()
                .Cast<CarTypes>()
                .Select(x => x.ToString());
            return carTypes;
        }

        public IEnumerable<Feature> GetAllFeatures()
        {
            
            var features = this.FeatureService.AllFeatures();
            return features;
        }

        protected void DDL_FilterByType_DataBound(object sender, EventArgs e)
        {
            this.DDL_FilterByType.Items.Insert(0, new ListItem("--- filter by car type ---", String.Empty));
        }
    }
}