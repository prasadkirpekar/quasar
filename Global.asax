<%@ Application Language="VB" %>

<script runat="server">

    Sub Application_Start(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs on application startup
        Dim x As DatabaseQueries = New DatabaseQueries()
        Dim s As String = x.Get_option(7)
        Dim t As String = "~/contents/templates/" + s + "/" + "single.aspx"
        Routing.RouteTable.Routes.MapPageRoute("post_route", "{post}", "~/contents/templates/" + s + "/" + "single.aspx")
        Routing.RouteTable.Routes.MapPageRoute("custom_route", "{type}/{query}", "~/contents/templates/" + s + "/" + "index.aspx")
        Routing.RouteTable.Routes.MapPageRoute("template_install_route","admin/" + s +  "/install", "~/contents/templates/" + s + "/" + "install.aspx")
        Routing.RouteTable.Routes.MapPageRoute("template_option_route", "admin/" + s + "/options", "~/contents/templates/" + s + "/" + "options.aspx")
        
         'Routing.RouteTable.Routes.MapPageRoute("profile_route", "profile/{username}", "~/default.aspx")
        ' Routing.RouteTable.Routes.MapPageRoute("page_wiz_route", "admin/{task}", "~/admin/page.aspx")
        
    End Sub
    
    Sub Application_End(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs on application shutdown
    End Sub
        
    Sub Application_Error(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs when an unhandled error occurs
    End Sub

    Sub Session_Start(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs when a new session is started
    End Sub

    Sub Session_End(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs when a session ends. 
        ' Note: The Session_End event is raised only when the sessionstate mode
        ' is set to InProc in the Web.config file. If session mode is set to StateServer 
        ' or SQLServer, the event is not raised.
    End Sub
       
</script>