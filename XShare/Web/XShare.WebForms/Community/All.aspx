<%@ Page Title="XShare Community" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="All.aspx.cs" Inherits="XShare.WebForms.Clients.All" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <div class="container-fluid">
            <div class="row text-center">
                <div class="col-md-8 col-md-offset-2">
                    <div class="panel panel-info">
                        <div class="panel-heading text-center"><%: Title %></div>
                        <asp:ListView ID="ViewAllUsers" runat="server"
                        SelectMethod="GridViewAll_GetUserData"
                        ItemType="XShare.Data.Models.User"
                        AllowPaging="True"
                        EnableSortingAndPagingCallback="True"
                        AllowSorting="True"
                        DataKeyNames="Id"
                        AutoGenerateColumns="false">
                        <LayoutTemplate>
                            <table class="table table-striped table-hover">
                                <tr>
                                    <th class="text-center">
                                        <asp:LinkButton Text="User Name" runat="server"
                                            ID="SortByUserName"
                                            CommandName="Sort"
                                            CommandArgument="UserName" />
                                    </th>
                                    <th class="text-center">
                                        <asp:LinkButton Text="Reservations Count" runat="server"
                                            ID="SortByResetrvationCount"
                                            CommandName="Sort"
                                            CommandArgument="Reservations.Count" />
                                    </th>
                                    <th class="text-center">
                                        <asp:LinkButton Text="Accidents Count" runat="server"
                                            ID="SortByAccidentsCount"
                                            CommandName="Sort"
                                            CommandArgument="Accidents.Count" />
                                    </th>
                                </tr>
                                <asp:PlaceHolder ID="itemplaceholder" runat="server" />
                            </table>
                        </LayoutTemplate>

                        <ItemTemplate runat="server">
                            <tr>
                                <td>
                                    <asp:Label Text='<%#: Item.UserName %>' runat="server" />
                                </td>
                                <td>
                                    <asp:Label Text='<%#: Item.Reservations.Count().ToString() %>' runat="server" />
                                </td>
                                <td>
                                    <asp:Label Text='<%#: Item.Accidents.Count().ToString() %>' runat="server" />
                                </td>
                            </tr>
                        </ItemTemplate>

                        <EmptyDataTemplate runat="server">
                            <h5 class="content-empty">No users available</h5>
                        </EmptyDataTemplate>
                    </asp:ListView>
                    </div>
                </div>
            </div>
            <div class="row text-center bs-component">
                <asp:DataPager ID="PagerReservations" PagedControlID="ViewAllUsers" runat="server" CssClass="btn-group btn-group-sm" PageSize="5">
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
    </div>
</asp:Content>
