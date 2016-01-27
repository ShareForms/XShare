<%@ Page Title="Accident Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Details.aspx.cs" Inherits="XShare.WebForms.Accident.Details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron text-center">
        <div class="container">
            <div class="row ">
                <asp:FormView runat="server" ID="ViewAccidentDetails"
                    ItemType="XShare.Data.Models.Accident"
                    SelectMethod="ViewAccidentDetails_GetItem"
                    CssClass="full-width">
                    <ItemTemplate>
                        <div class=" col-md-12">
                            <h2 class="page-header"><%: Title %></h2>
                        </div>
                        <div class=" col-md-12">
                            <div class="col-md-6">
                                <div class="panel panel-info">
                                    <div class="panel-heading">Image</div>
                                    <div class="panel-body">
                                        <asp:Image ID="CrashImage" runat="server" ImageUrl='<%#: Item.Picture %>' Width="75%" />
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="panel panel-info">
                                    <div class="panel-heading"><%#: Item.Location %></div>
                                    <div class="panel-body">
                                        <asp:Label Text='<%#: Item.Description %>' runat="server" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:FormView>
                <hr />
                <div class="row">
                    <div class="back-link">
                        <asp:UpdatePanel ID="UpdatePanelAccidents" runat="server" class="panel"
                            UpdateMode="Conditional">
                            <ContentTemplate>
                                <asp:Button Text="Back Home" runat="server" CssClass="btn btn-primary" OnClick="BackHomeClik" />
                                <asp:Button ID="InvokeAccidentsList" Text="Show Accidents" CssClass="btn btn-primary" runat="server" OnClick="ShowGridWithAccidents" />
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
                <br />
            </div>
        </div>
    </div>

    <div class="jumbotron">
        <asp:UpdatePanel ID="UpdatePanelWithAccidents" runat="server">
            <ContentTemplate>
                <asp:Panel ID="ViewAllAccidentsList" runat="server" Visible="false" class="row text-center">

                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="panel panel-info">
                                    <div class="panel-heading text-center"><%: Title %></div>
                                    <asp:ListView ID="ViewAllAccidents" runat="server"
                                        SelectMethod="GridViewAll_GetAccidents"
                                        ItemType="XShare.Data.Models.Accident"
                                        AllowPaging="True"
                                        EnableSortingAndPagingCallback="True"
                                        DataKeyNames="Id"
                                        AutoGenerateColumns="false">
                                        <LayoutTemplate>
                                            <div class="table-responsive">
                                                <table class="table table-striped  table-bordered table-hover">
                                                    <tr>
                                                        <th class="text-center">
                                                            <asp:Literal Text="Image" runat="server" />
                                                        </th>
                                                        <th class="text-center">
                                                            <asp:Literal Text="Date" runat="server" />
                                                        </th>
                                                        <th class="text-center">
                                                            <asp:Literal Text="Loacation" runat="server" />
                                                        </th>
                                                    </tr>
                                                    <asp:PlaceHolder ID="itemplaceholder" runat="server" />
                                                </table>
                                            </div>
                                        </LayoutTemplate>

                                        <ItemTemplate runat="server">
                                            <tr>
                                                <td>
                                                    <asp:Image ImageUrl='<%#: Item.Picture %>' CssClass="img-table" runat="server" />
                                                </td>
                                                <td>
                                                    <asp:Literal Text='<%#: String.Format("{0}",Item.Date.ToShortDateString()) %>' runat="server" />
                                                </td>
                                                <td>
                                                    <asp:Literal Text='<%#: Item.Location %>' runat="server" />
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                        <EmptyDataTemplate runat="server">
                                            <h5 class="content-empty">No items available</h5>
                                        </EmptyDataTemplate>
                                    </asp:ListView>
                                </div>
                                <div class="bs-component text-center">
                                    <asp:DataPager ID="DataPagerAll" PagedControlID="ViewAllAccidents" PageSize="5" runat="server" CssClass="btn-group btn-group-sm">
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
                    </div>

                </asp:Panel>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>

</asp:Content>
