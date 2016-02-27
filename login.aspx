<%@ Page Language="VB" AutoEventWireup="false" CodeFile="login.aspx.vb" Inherits="login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login/Register</title>
    <link href="shared-assets/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet"
        type="text/css" />
    <link href="shared-assets/css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="navbar navbar-default navbar-static-top">
      <div class="container">
        <div class="navbar-header">
          <a class="navbar-brand" href="#">CMS</a>
        </div>
        
          <ul class="nav navbar-nav navbar-right">
            <li><a href="default.aspx">Go back</a></li>
          </ul>
        
      </div>
    </div>
    <asp:Panel ID="login" runat="server" Visible="false">
        <div class="user-form">
            <div class="row ">
                <div class="col-md-4">
                </div>
                <div class="col-md-4">
                    <div class="panel  panel-default">
                        <div class="panel-heading">
                            Login to CMS</div>
                        <div class="panel-body">
                            <asp:Label ID="log_alert" runat="server" Text=""></asp:Label>
                            <asp:TextBox ID="username_log" CssClass="form-control" placeholder="username" runat="server"></asp:TextBox><br />
                            <asp:TextBox ID="password_log" CssClass="form-control" TextMode="Password" placeholder="password" runat="server"></asp:TextBox><br />
                            <asp:CheckBox ID="remember"  runat="server" />
                            <label style="display: inline; float: right">
                                keep me logged in</label>
                            <br />
                            <asp:Button ID="login_btn" CssClass="btn btn-info form-control" runat="server" Text="Login" /><br />
                        </div>
                        <div class="panel-footer">
                            <asp:Button ID="register_btn" CssClass="btn btn-info" Style="float: right" runat="server"
                                Text="Register" />
                            <asp:Button ID="forgot_pass_btn" CssClass="btn btn-info" Style="float: left" runat="server"
                                Text="Forgot password" />
                            <br />
                            <br />
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                </div>
            </div>
            </div>
    </asp:Panel>
    <asp:Panel ID="register" Visible="false" runat="server">
    <div class="user-form">
        <div class="row">
            <div class="col-md-4">
            </div>
            <div class="col-md-4">
                <div class="panel  panel-default">
                    <div class="panel-heading">
                        Register and get started</div>
                    <div class="panel-body">
                        <div id="user_alert" runat="server" class="alert  alert-info">
                            Enter new username and email. password will be emailed you</div>
                           
                        <asp:TextBox ID="username_reg" CssClass="form-control" placeholder="username" runat="server"></asp:TextBox><br />
                        <asp:TextBox ID="email_reg" CssClass="form-control" placeholder="email" runat="server"></asp:TextBox><br />
                        <asp:Button ID="register_btn_action" CssClass="btn btn-info form-control" runat="server" Text="Get password" /><br />
                    </div>
                    <div class="panel-footer">
                        <label class="label label-info">
                            Check your spam folder too</label>
                        <a href="login.aspx?action=login" class="right-control">Login</a>
                        <br />
                    </div>
                </div>
            </div>
            <div class="col-md-4">
            </div>
        </div>
        </div>
    </asp:Panel>
    
    <asp:Panel ID="logout" runat="server" Visible="false">
        <div class="form-center">
            <label class="alert  alert-success">
                You are logged out successfully <a href="login.aspx?action=login">Login again</a></label>
        </div>
    </asp:Panel>
    <asp:Panel ID="panel1" CssClass="user-form" runat="server" Visible="false">
        <div class="row">
            <div class="col-md-4">
            </div>
            <div class="col-md-4">
                <label class="alert  alert-info">
                    Enter email/username and click on "Recover password" Or <a href="login.aspx?action=login">
                        login here</a></label><br />
                <asp:TextBox ID="TextBox3" CssClass="form-control" Style="display: inline" placeholder="username/email"
                    runat="server"></asp:TextBox><br />
                <asp:Button ID="Button4" CssClass="btn btn-info" runat="server" Text="Recover password" />
            </div>
            <div class="col-md-4">
            </div>
        </div>
    </asp:Panel>

    </form>
    
    
</body>
</html>
