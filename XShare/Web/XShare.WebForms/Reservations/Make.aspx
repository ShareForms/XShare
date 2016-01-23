<%@ Page Title="Make new reservation" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Make.aspx.cs" Inherits="XShare.WebForms.Reservations.Make" %>

<asp:Content ID="BodyContentMake" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid">
        <div class="row text-center">
            <h2><%: Title %></h2>
            <p class="text-danger">
                <asp:Literal runat="server" ID="ErrorMessage" />
            </p>
            <hr />
            <div class="form-horizontal">
                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="FromTime" CssClass="col-md-3 control-label">Reserve from</asp:Label>
                    <div class="col-md-5">
                        <asp:TextBox runat="server" ID="FromTime" CssClass="form-control" TextMode="DateTimeLocal" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="FromTime"
                            CssClass="text-danger" ErrorMessage="Start date and time of reservation is required." />
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="ToTime" CssClass="col-md-3 control-label">Reserve to</asp:Label>
                    <div class="col-md-5">
                        <asp:TextBox runat="server" ID="ToTime" CssClass="form-control" TextMode="DateTimeLocal" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="ToTime"
                            CssClass="text-danger" ErrorMessage="Start date and time of reservation is required." />
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-md-5 col-md-offset-3">
                        <asp:Button runat="server" OnClick="CheckAvailableCars_Click" Text="Check Available Cars" CssClass="btn btn-success full-width" />
                    </div>
                </div>
            </div>
        </div>
        <hr />
        <div class="row text-center">
            <div class="col-md-12">
                <div class="panel panel-info">
                    <asp:ListView ID="ViewAvailableCars" runat="server"
                        SelectMethod="GridViewAll_GetData"
                        ItemType="XShare.Data.Models.Car"
                        Visible="False"
                        Enabeled="False"
                        AllowPaging="True"
                        EnableSortingAndPagingCallback="True"
                        AllowSorting="True"
                        DataKeyNames="Id"
                        AutoGenerateColumns="false">
                        <LayoutTemplate>
                            <div class="panel-heading text-center">Available Cars for the selected period</div>
                            <table class="table table-striped table-hover">
                                <tr>
                                    <th class="text-center">
                                        <asp:Literal Text="Image" runat="server" />
                                    </th>
                                    <th class="text-center">
                                        <asp:LinkButton Text="Model" runat="server"
                                            ID="SortByModel"
                                            CommandName="Sort"
                                            CommandArgument="Description" />
                                    </th>
                                    <th class="text-center">
                                        <asp:LinkButton Text="Type" runat="server"
                                            ID="SortByCarType"
                                            CommandName="Sort"
                                            CommandArgument="CarType" />
                                    </th>
                                    <th class="text-center">
                                        <asp:LinkButton Text="Fuel Economy" runat="server"
                                            ID="SortByFuelEconomy"
                                            CommandName="Sort"
                                            CommandArgument="FuelEconomy" />
                                    </th>
                                    <th class="text-center">
                                        <asp:Literal Text="Details" runat="server" />
                                    </th>
                                </tr>
                                <asp:PlaceHolder ID="itemplaceholder" runat="server" />
                            </table>
                        </LayoutTemplate>

                        <ItemTemplate>
                            <tr>
                                <td>
                                    <asp:Image ImageUrl='<%# Item.PictureUrl %>' Width="50px" runat="server" />
                                </td>
                                <td>
                                    <asp:Label Text='<%# Item.Description %>' runat="server" />
                                </td>
                                <td>
                                    <asp:Label Text='<%# Item.CarType %>' runat="server" />
                                </td>
                                <td>
                                    <asp:Label Text='<%# Item.FuelEconomy + " l/100 km" %>' runat="server" />
                                </td>
                                <td>
                                    <asp:HyperLink NavigateUrl='<%# "Details/" + Item.Id %>' runat="server"> Details
                                    </asp:HyperLink>
                                </td>
                            </tr>
                        </ItemTemplate>

                        <EmptyDataTemplate>
                            <h5 class="content-empty">No items available</h5>
                        </EmptyDataTemplate>
                    </asp:ListView>
                </div>
            </div>
        </div>
        <div class="bs-component text-center">
            <asp:DataPager ID="DataPagerAvailable" PagedControlID="ViewAvailableCars" PageSize="5" runat="server" CssClass="btn-group btn-group-sm">
                <Fields>
                    <asp:NextPreviousPagerField PreviousPageText="<" FirstPageText="<<" ShowPreviousPageButton="true"
                        ShowFirstPageButton="true" ShowNextPageButton="false" ShowLastPageButton="false" ButtonType="Button"
                        ButtonCssClass="btn btn-default" RenderNonBreakingSpacesBetweenControls="false" RenderDisabledButtonsAsLabels="false" />

                    <asp:NumericPagerField ButtonType="Button" CurrentPageLabelCssClass="btn btn-primary disabled" RenderNonBreakingSpacesBetweenControls="false"
                        NumericButtonCssClass="btn btn-default" ButtonCount="10" NextPageText="..." NextPreviousButtonCssClass="btn btn-default" />

                    <asp:NextPreviousPagerField NextPageText=">" LastPageText=">>" ShowNextPageButton="true"
                        ShowLastPageButton="true" ShowPreviousPageButton="false" ShowFirstPageButton="false" ButtonType="Button"
                        ButtonCssClass="btn btn-default" RenderNonBreakingSpacesBetweenControls="false" RenderDisabledButtonsAsLabels="false" />
                </Fields>
            </asp:DataPager>
        </div>
    </div>
</asp:Content>
