<%@ Page Title="Car Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CarDetails.aspx.cs" Inherits="XShare.WebForms.Cars.CarDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <div class="row text-center">
            <div class="col-md-8 col-md-offset-2">
                <asp:FormView runat="server" ID="ViewCarDetails"
                    ItemType="XShare.Data.Models.Car"
                    SelectMethod="ViewCarDetails_GetItem">
                    <ItemTemplate>
                        <header>
                            <h1><%: Title %></h1>
                        </header>
                        <div>
                            <asp:Image ImageUrl='<%#: Item.PictureUrl %>' Width="75%" runat="server" />
                        </div>
                        <br />
                        <div>
                            <span class="glyphicon glyphicon-tag" aria-hidden="true"></span>
                            <asp:Label Text='<%#: Item.Description %>' runat="server" />
                        </div>
                        <div>
                            <span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
                            <asp:Label Text='<%#: Item.CarType %>' runat="server" />
                        </div>
                        <div>
                            <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
                            <asp:Label Text='<%#: string.Format("{0:F2}", Item.Ratings.Any() ? Item.Ratings.Average(r => r.Value) : 0.0f) %>' runat="server" />
                        </div>
                        <br />
                    </ItemTemplate>
                </asp:FormView>
                <br />
                <div class="row text-center">
                    <div class="col-md-10">
                        <div class="form-group text-center">
                            <label for="CarRate" class="col-md-3 control-label">Rate This Car</label>
                            <div class="col-md-6">
                                <asp:DropDownList ID="CarRate" runat="server" CssClass="form-control select" SelectMethod="GetCarRatings" />
                            </div>
                            <div class="col-md-3">
                                <asp:Button ID="Btn" runat="server" OnClick="Btn_RateCar" Text="Rate!" CssClass="btn btn-info full-width" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="back-link">
                <asp:button id="btnCancel" runat="server" 
                    text="Go back" 
                    OnClientClick="JavaScript:window.history.back(1); return false;" 
                    CssClass="btn btn-default"/>
            </div>
        </div>
    </div>
</asp:Content>
