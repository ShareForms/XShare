﻿namespace XShare.WebForms.Admin
{
    using System;
    using System.Linq;
    using System.Web.UI;
    using Ninject;
    using XShare.Common.Extensions;
    using XShare.Data.Models;
    using XShare.Services.Data.Contracts;
    using XShare.WebForms.Controls.Notificator;

    public partial class ManageReservations : Page
    {
        [Inject]
        public IReservationService ReservationService { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        public void ListViewReservations_DeleteItem(int Id)
        {
            this.ReservationService.DeleteById(Id);
            Notificator.AddWarningMessage($"I've just deleted reservation with id {Id} - the process is irreversible. Just to know!");
        }

        public void ListViewReservations_UpdateItem(int Id)
        {
            var item = this.ReservationService.GetById(Id);

            if (item == null)
            {
                this.ModelState.AddModelError("", $"Item with id {this.ID} was not found");
                return;
            }

            this.TryUpdateModel(item);
            if (this.ModelState.IsValid)
            {
                this.ReservationService.UpdateReservation(item);
                Notificator.AddInfoMessage($"You've just updated the info for reservation with id {item.Id}");
            }
        }

        public IQueryable<Reservation> GridViewAll_GetData(string sortByExpression)
        {
            var reservationsQuery = this.ReservationService.GetFiltered(
                this.TB_FiltreFromLocation.Text,
                this.TB_FiltreToLocation.Text,
                this.TB_FiltreByCarModel.Text,
                this.TB_FiltreByUser.Text);

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
            this.ViewLastestReservations.DataBind();
        }

        protected void OnClearFIltersClick(object sender, EventArgs e)
        {
            this.TB_FiltreFromLocation.Text = null;
            this.TB_FiltreToLocation.Text = null;
            this.TB_FiltreByCarModel.Text = null;
            this.TB_FiltreByUser.Text = null;

            this.ViewLastestReservations.DataBind();
        }
    }
}