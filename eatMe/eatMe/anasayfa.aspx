<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/master.Master" AutoEventWireup="true" CodeBehind="anasayfa.aspx.cs" Inherits="eatMe.mastercontent" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Eat Me!</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="menus">
        <a href="menuler.aspx"><h1 style="color:White;padding-left:95px;padding-top:150px;">MENÜLER</h1></a>
    </div>
    <div class="restaurants">
        <a href="restoranlar.aspx"><h1 style="color:White;padding-left:155px;padding-top:150px;">RESTORANLAR</h1></a>
    </div>
    <div class="advantages">
        <a href="#"><h1 style="color:White;padding-left:220px;padding-top:160px;">FIRSATLAR</h1></a>
    </div>
    <div class="random">
        <a href="#"><h1></h1></a>
    </div>
</asp:Content>
