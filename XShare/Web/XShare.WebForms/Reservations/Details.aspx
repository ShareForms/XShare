<%@ Page Title="Reservation details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Details.aspx.cs" Inherits="XShare.WebForms.Reservations.Details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron text-center">
        <div class="container">
            <div class="row ">

                <asp:FormView runat="server" ID="ViewReservationDetails"
                    ItemType="XShare.Data.Models.Reservation"
                    SelectMethod="ViewReservationDetails_GetItem"
                    CssClass="full-width">
                    <ItemTemplate>
                        <div class=" col-md-12">
                            <h2 class="page-header"><%: Title %></h2>
                        </div>
                        <div class=" col-md-12">
                            <div class="col-md-6">
                                <div class="panel panel-info">
                                    <div class="panel-heading">Take at</div>
                                    <div class="panel-body">
                                        <asp:Label Text='<%# Item.FromTime %>' runat="server" />
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="panel panel-info">
                                    <div class="panel-heading">From</div>
                                    <div class="panel-body">
                                        <asp:Label Text='<%# Item.From %>' runat="server" />
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class=" col-md-12">
                            <div class="col-md-6">
                                <div class="panel panel-danger">
                                    <div class="panel-heading">Leave at</div>
                                    <div class="panel-body">
                                        <asp:Label Text='<%# Item.ToTime %>' runat="server" />
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="panel panel-danger">
                                    <div class="panel-heading">To</div>
                                    <div class="panel-body">
                                        <asp:Label Text='<%# Item.To %>' runat="server" />
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class=" col-md-12">
                            <div class="col-md-3">
                                <div class="panel panel-default">
                                    <div class="panel-heading">Car model</div>
                                    <div class="panel-body">
                                        <asp:Label Text='<%# Item.Car.Description %>' runat="server" />
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="panel panel-default">
                                    <div class="panel-heading">Car Fuel economy</div>
                                    <div class="panel-body">
                                        <asp:Label Text='<%# Item.Car.FuelEconomy %>' runat="server" />
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-3">
                                <div class="panel panel-default">
                                    <div class="panel-heading">Car Type</div>
                                    <div class="panel-body">
                                        <asp:Label Text='<%# Item.Car.CarType %>' runat="server" />
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-3">
                                <div class="panel panel-warning">
                                    <div class="panel-heading">Car Rating</div>
                                    <div class="panel-body">
                                        <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
                                        <asp:Label Text='<%# string.Format("{0:F2}", Item.Car.Ratings.Any() ? Item.Car.Ratings.Average(r => r.Value) : 0.0f) %>' runat="server" />
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class=" col-md-12">
                            <div class="col-md-6 col-md-offset-6">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <asp:HyperLink NavigateUrl='<%# string.Format("~/Cars/CarDetails.aspx?id={0}", Item.Car.Id) %>' runat="server"> Car
                                    </asp:HyperLink>
                                    </div>
                                    <div class="panel-body">
                                        <asp:Image ImageUrl='<%# Item.Car.PictureUrl %>' Width="75%" runat="server" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <br />
                             <br />
                    </ItemTemplate>
                </asp:FormView>
                <hr />
                <br />
                <div class="row">
                    <div class="back-link">
                        <a href="/Reservations/Latest">Back to Reservations</a>
                    </div>
                </div>
                <br />
            </div>
        </div>
    </div>
</asp:Content>
