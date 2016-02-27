Imports System.Data.SqlClient
Imports System.Data
Imports System.Security.Cryptography
Imports security
Partial Class login
    Inherits System.Web.UI.Page



    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim x1 As DatabaseQueries = New DatabaseQueries
        If x1.init() = False Then
            Response.Redirect("~/installer.aspx")
        End If
        Dim action As String = Request.QueryString("action")
        If action = "logout" Then
            Session.Clear()
            Response.Cookies.Clear()
            logout.Visible = True
        ElseIf action = "login" Then
            If Not x1.Get_option(5) = "True" Then
                register_btn.Visible = False
                forgot_pass_btn.CssClass = "btn btn-info form-control"
            End If
            login.Visible = True
        ElseIf action = "forgot-password" Then
            panel1.Visible = True
            Page.Title = "Recover password"
        ElseIf action = "register" And x1.Get_option(5) = "True" Then
            register.Visible = True
        Else
            If Not x1.Get_option(5) = "True" Then
                register_btn.Visible = False
                forgot_pass_btn.CssClass = "btn btn-info form-control"
            End If
            login.Visible = True
        End If
        
    End Sub

    Protected Sub forgot_pass_btn_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles forgot_pass_btn.Click
        Response.Redirect("login.aspx?action=forgot-password")
    End Sub

    Protected Sub register_btn_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles register_btn.Click

        Response.Redirect("login.aspx?action=register")
    End Sub

    Protected Sub login_btn_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles login_btn.Click
        Dim x As DatabaseQueries = New DatabaseQueries()
        If x.user_exist(username_log.Text) = True Then
            Dim p As ArrayList = x.Get_USER_INFO(username_log.Text)
            If password_log.Text = p(2) Then
                Session("name") = username_log.Text
                If remember.Checked = True Then
                    Dim lc As HttpCookie = New HttpCookie("name")
                    lc.Value = username_log.Text
                    lc.Expires = DateTime.Now.AddDays(14)
                    Response.Cookies.Add(lc)
                End If
                Response.Redirect("admin/")
            Else
                log_alert.Text = "failed"
            End If
        Else
            log_alert.Text = "No user found with this username"
        End If

    End Sub

    Protected Sub register_btn_action_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles register_btn_action.Click
        Dim r As Boolean
        If username_reg.Text = "" Or email_reg.Text = "" Then
            user_alert.InnerHtml = "Username or Email is empty"
        Else
            Dim x As DatabaseQueries = New DatabaseQueries()
            Dim x2 As security = New security()
            Dim pass As String = x2.random_string()
            r = x.ADD_USER(username_reg.Text, pass, email_reg.Text, x.Get_option(6))
        End If
        If r Then
            user_alert.InnerHtml = "Success! check your email."
        Else
            
            user_alert.InnerHtml = "Failed to create username/email already exist"
        End If
    End Sub
End Class
