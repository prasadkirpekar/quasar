
Partial Class _Default
    Inherits System.Web.UI.Page
    Dim x As DatabaseQueries = New DatabaseQueries()
    Protected Sub Page_PreInit(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreInit
        Dim s As String = "~/contents/templates/" + x.Get_option(7) + "/" + x.Get_option(7) + ".master"
        Page.MasterPageFile = s
    End Sub
End Class
