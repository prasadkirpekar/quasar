<%@ Page Language="VB" AutoEventWireup="false" CodeFile="installer.aspx.vb" Inherits="installer" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Install CMS on your server</title>
    <link href="shared-assets/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet"
        type="text/css" />
        <style type="text/css">
        *
        {
            border-radius:0px!important;}
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="margin-top:5%">
    <div class="row">
        <div class="col-md-3">
        </div>
        <div class="col-md-6">
            <asp:Label ID="alert" Width="100%" runat="server" Text=""></asp:Label><br /><br />
            <div class="panel panel-default">
            <div class="panel-heading">Site settings</div>
            <div class="panel-body">
            <asp:TextBox ID="site_title" CssClass="form-control" placeholder="Site title" runat="server"></asp:TextBox><br />
            <asp:TextBox ID="description" CssClass="form-control" placeholder="One line description about site" runat="server"></asp:TextBox><br />
            </div>
            </div>
            <div class="panel panel-default">
            <div class="panel-heading">Administrator settings</div>
            <div class="panel-body">
            <asp:TextBox ID="_database" CssClass="form-control" placeholder="Database name" runat="server"></asp:TextBox><br />
            <asp:TextBox ID="username" CssClass="form-control" placeholder="Admin username" runat="server"></asp:TextBox><br />
            <asp:TextBox ID="pass" CssClass="form-control" placeholder="Admin password" runat="server"></asp:TextBox><br />
            <asp:TextBox ID="email" CssClass="form-control" placeholder="Admin email" runat="server"></asp:TextBox><br />
            </div>
            </div>
            
            <asp:Button ID="create" CssClass="btn btn-primary form-control" runat="server" Text="Install" />
        </div>
        <div class="col-md-3">
        </div>
    </div>
    </div>
    </form>
</body>
</html>
