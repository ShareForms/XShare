<%@ Page Title="Lastest Reservations" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Latest.aspx.cs" Inherits="XShare.WebForms.Reservations.Latest" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <div class="container">
            <asp:LoginView runat="server" ViewStateMode="Disabled">
                <LoggedInTemplate>
                    <div class="row text-center">
                        <div class="col-md-8 col-md-offset-2">
                            <asp:Button Text="Make new reservation" runat="server" CssClass="btn btn-lg btn-primary" />
                        </div>
                    </div>
                </LoggedInTemplate>
            </asp:LoginView>
            <br />
            <div class="row text-center">
                <div class="col-md-8 col-md-offset-2">
                    <div class="panel panel-info">
                        <div class="panel-heading text-center"><%: Title %></div>
                        <asp:ListView ID="ViewLastestReservations" runat="server"
                            AllowPaging="True"
                            SelectMethod="GridViewAll_GetData"
                            ItemType="XShare.Data.Models.Reservation"
                            EnableSortingAndPagingCallback="True"
                            AllowSorting="True"
                            DataKeyNames="Id"
                            AutoGenerateColumns="false">
                            <LayoutTemplate>
                                <table class="table table-striped table-hover">
                                    <tr>
                                        <th class="text-center">
                                            <asp:LinkButton Text="Reserved from" runat="server"
                                                ID="SortByFromTime"
                                                CommandName="Sort"
                                                CommandArgument="FromTime" />
                                        </th>
                                        <th class="text-center">
                                            <asp:LinkButton Text="Reserved to" runat="server"
                                                ID="SortByToTime"
                                                CommandName="Sort"
                                                CommandArgument="ToTime" />
                                        </th>
                                        <th class="text-center">
                                            <asp:LinkButton Text="From" runat="server"
                                                ID="SortByFrom"
                                                CommandName="Sort"
                                                CommandArgument="From" />
                                        </th>
                                        <th class="text-center">
                                            <asp:LinkButton Text="To" runat="server"
                                                ID="SortByTo"
                                                CommandName="Sort"
                                                CommandArgument="To" />
                                        </th>
                                        <th class="text-center">
                                            <asp:LinkButton Text="Car" runat="server"
                                                ID="SortByDescription"
                                                CommandName="Sort"                                                
                                                CommandArgument="Car.Description" />
                                        </th>
                                        <th class="text-center">
                                            <asp:LinkButton Text="User" runat="server" 
                                                ID="SortByUser"
                                                CommandName="Sort"
                                                CommandArgument="User.UserName"/>
                                        </th>
                                    </tr>
                                    <asp:PlaceHolder ID="itemplaceholder" runat="server" />
                                </table>
                            </LayoutTemplate>

                            <ItemTemplate>
                                <tr>
                                    <td>
                                        <asp:Literal Text='<%# String.Format("{0} {1}",Item.FromTime.ToShortDateString(), Item.FromTime.ToShortTimeString())   %>' runat="server" />
                                    </td>
                                    <td>
                                        <asp:Literal Text='<%# String.Format("{0} {1}",Item.ToTime.ToShortDateString(), Item.ToTime.ToShortTimeString())  %>' runat="server" />
                                    </td>
                                    <td>
                                        <asp:Literal Text='<%# Item.From %>' runat="server" />
                                    </td>
                                    <td>
                                        <asp:Literal Text='<%# Item.To %>' runat="server" />
                                    </td>
                                    <td>
                                        <asp:Literal Text='<%# Item.Car.Description %>' runat="server" />
                                    </td>
                                    <td>
                                        <asp:Label Text='<%#  Item.User.UserName %>' runat="server" />

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

            <div class="row text-center bs-component">
                <asp:DataPager ID="PagerReservations" PagedControlID="ViewLastestReservations" runat="server" CssClass="btn-group btn-group-sm" PageSize="10">
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
