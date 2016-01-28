<%@ Page Title="Car Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CarDetails.aspx.cs" Inherits="XShare.WebForms.Cars.CarDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <div class="row text-center">
            <div class="col-md-12">
                <div class="row">
                    <div class="col-md-12">
                        <asp:FormView runat="server" ID="ViewCarDetails"
                            ItemType="XShare.Data.Models.Car"
                            SelectMethod="ViewCarDetails_GetItem"
                            RenderOuterTable="false">
                            <ItemTemplate>
                                <div class="col-md-12">
                                    <div class="row">
                                        <div class="col-md-2 text-left">
                                            <asp:Button ID="btnCancel" runat="server"
                                                Text="Go back"
                                                OnClientClick="JavaScript:window.history.back(1); return false;"
                                                CssClass="btn btn-md btn-default" />
                                        </div>
                                        <div class="col-md-8">
                                            <h1><%: Title %></h1>
                                        </div>
                                    </div>
                                    <br />
                                    <div class="row">
                                        <div class="col-md-12">
                                            <asp:Image CssClass="img-responsive center-block" ImageUrl='<%#: Item.PictureUrl %>' runat="server" />
                                        </div>
                                    </div>
                                    <br />
                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="list-group">
                                                        <div class="list-group-item active">
                                                            <span>Car info:</span>
                                                        </div>
                                                        <div class="list-group-item">
                                                            <span class="glyphicon glyphicon-tag" aria-hidden="true"></span>
                                                            <asp:Label Text='<%#: Item.Description %>' runat="server" />
                                                        </div>
                                                        <div class="list-group-item">
                                                            <span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
                                                            <asp:Label Text='<%#: Item.CarType %>' runat="server" />
                                                        </div>
                                                        <div class="list-group-item">
                                                            <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
                                                            <asp:Label Text='<%#: string.Format("{0:F2}", Item.Ratings.Any() ? Item.Ratings.Average(r => r.Value) : 0.0f) %>' runat="server" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="list-group">
                                                        <div class="list-group-item active">
                                                            <span>Car features:</span>
                                                        </div>

                                                        <asp:Repeater runat="server"
                                                            DataSource='<%# Item.Features %>'>
                                                            <ItemTemplate>

                                                                <div class="list-group-item">
                                                                    <asp:Literal runat="server" Text='<%# Eval("Value") %>' />
                                                                </div>

                                                            </ItemTemplate>
                                                        </asp:Repeater>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                            </ItemTemplate>
                        </asp:FormView>

                        <div class="col-md-4">
                            <div class="form-group text-center">
                                <div class="list-group">
                                    <div class="list-group-item active">
                                        <span class="text-info">Rate This Car</span>
                                    </div>

                                    <div class="list-group-item">
                                        <asp:DropDownList ID="CarRateDropDown" runat="server" CssClass="form-control select" SelectMethod="GetCarRatings" />
                                    </div>
                                    <div class="list-group-item">
                                        <asp:Button ID="Btn" runat="server" OnClick="Btn_RateCar" Text="Rate!" CssClass="btn btn-info full-width" />
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>

                </div>



            </div>
            <br />
            <%-- <div class="row text-center">
                    <div class="col-md-4">
                        <div class="form-group text-center">
                            <label for="CarRate" class="col-md-12 control-label">Rate This Car</label>
                            <div class="col-md-12">
                                <asp:DropDownList ID="CarRate" runat="server" CssClass="form-control select" SelectMethod="GetCarRatings" />
                            </div>
                            <div class="col-md-12">
                                <asp:Button ID="Btn" runat="server" OnClick="Btn_RateCar" Text="Rate!" CssClass="btn btn-info full-width" />
                            </div>
                        </div>
                    </div>
                </div>--%>
        </div>

    </div>
    </div>
</asp:Content>
