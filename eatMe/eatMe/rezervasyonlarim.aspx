<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/master.Master" AutoEventWireup="true" CodeBehind="rezervasyonlarim.aspx.cs" Inherits="eatMe.rezervasyonlarim1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="border:1px solid cornflowerblue;">
		<div class="list">
            <div class="listBody">
                <div class="listBodyInside">
                    <asp:PlaceHolder ID="ph_rezervasyonlar" runat="server"></asp:PlaceHolder>
                </div>
            </div>
        </div>
	</div>
</asp:Content>
