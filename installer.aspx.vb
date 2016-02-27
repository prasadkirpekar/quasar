Imports System.Data.SqlClient

Partial Class installer
    Inherits System.Web.UI.Page

    Protected Sub create_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles create.Click
        Dim s As String = "Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;Connect Timeout=30;User Instance=True"
        Dim db As SqlConnection = New SqlConnection(s)
        db.Open()

        Dim user_table As SqlCommand = New SqlCommand("CREATE TAble user_info(id int identity(1,1) primary key,username varchar(50) not null unique,password varchar(50) not null,email varchar(50)not null unique,avatar varchar(500) not null default '../contents/uploads/a/default.png',role int not null,post_count int not null);", db)
        Dim contents As SqlCommand = New SqlCommand("create table contents(id int identity(1,1) primary key,title varchar(50) not null,uri varchar(50) not null unique,ctext varchar(1000),seo_title varchar(50),seo_meta varchar(150),ctype int not null,cat_id int,comm_count int default 0,status int default 0,author_id int,date varchar(50),views int default 0);", db)
        Dim comments As SqlCommand = New SqlCommand("create table comments(id int identity(1,1) primary key,comment varchar(1000) not null,author varchar(50) not null,author_email varchar(50) not null,post_id int not null,date varchar(50),status int not null);", db)
        Dim category_table As SqlCommand = New SqlCommand("create table categories(id int identity(1,1) primary key,title varchar(50) not null unique,description varchar(100),post_count int);", db)
        Dim nav_table As SqlCommand = New SqlCommand("create table nav(id int identity(1,1) primary key,name varchar(50) not null unique,titles varchar(50)not null,url varchar(50)not null);", db)
        Dim noti_table As SqlCommand = New SqlCommand("create table notifications(id int identity(1,1) primary key,type int not null,text varchar(50) not null,status int not null,author_id int not null);", db)
        Dim sett_table As SqlCommand = New SqlCommand("create table settings(id int not null,value varchar(500) not null);", db)
        Dim stat_table As SqlCommand = New SqlCommand("create table stats(date varchar(10) not null unique,views int default 0);", db)
        Dim temp_table As SqlCommand = New SqlCommand("create table templates(name varchar(10=) not null unique,is_installed int default 0);", db)

        Dim add As SqlCommand = New SqlCommand("insert into stats values('" + Date.Today.ToShortDateString() + "',1)", db)
        Try
            comments.ExecuteNonQuery()
            sett_table.ExecuteNonQuery()
            category_table.ExecuteNonQuery()
            nav_table.ExecuteNonQuery()
            user_table.ExecuteNonQuery()
            noti_table.ExecuteNonQuery()
            contents.ExecuteNonQuery()
            stat_table.ExecuteNonQuery()
            add.ExecuteNonQuery()
            temp_table.ExecuteNonQuery()
            init_sett(db)

            alert.Text = "Database tables created.<a href=" & "~/admin" & "> Navigate to admin panel</a> and login with current username and password"
            alert.CssClass = "alert alert-success"
        Catch ex As SqlException
            alert.Text = "Failed to creates tables make sure everything you entered is correct"
            alert.CssClass = "alert alert-danger"
        End Try
    End Sub
    Sub init_sett(ByVal db As SqlConnection)
        Dim admin_init As SqlCommand = New SqlCommand("insert into user_info values(@username,@password,@email,@role,@post_count);", db)
        admin_init.Parameters.AddWithValue("@username", username.Text)
        admin_init.Parameters.AddWithValue("@password", pass.Text)
        admin_init.Parameters.AddWithValue("@email", email.Text)
        admin_init.Parameters.AddWithValue("@role", 1)
        admin_init.Parameters.AddWithValue("@post_count", 0)
        Dim site_init As SqlCommand = New SqlCommand("insert into settings values(@id,@value);", db)
        site_init.Parameters.AddWithValue("@id", 1)
        site_init.Parameters.AddWithValue("@value", site_title.Text)
        Dim site_init_2 As SqlCommand = New SqlCommand("insert into settings values(@id,@value);", db)
        site_init_2.Parameters.AddWithValue("@id", 2)
        site_init_2.Parameters.AddWithValue("@value", description.Text)
        site_init.ExecuteNonQuery()
        site_init_2.ExecuteNonQuery()
        admin_init.ExecuteNonQuery()

        

    End Sub
End Class
