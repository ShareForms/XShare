namespace XShare.Services.Data.Contracts
{
    using System.Linq;
    using XShare.Data.Models;

    public interface IReservationService
    {
        IQueryable<Reservation> AllReservationss();

        int ReservationCount();
    }
}