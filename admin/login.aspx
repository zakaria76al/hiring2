<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Hiring.admin.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Login</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="description" content="" />
	<meta name="keywords" content="">
	<meta name="author" content="Phoenixcoded" />
	<link rel="icon" href="assets/images/favicon.ico" type="image/x-icon">
	<link rel="stylesheet" href="assets/css/style.css">
</head>
<body>
    <div class="auth-wrapper">
        <div class="auth-content">
            <div class="card">
                <div class="row align-items-center text-center">
                    <div class="col-md-12">
                        <form id="form2" runat="server">
                            <div class="card-body">
                                <img style="height: 40px;" src="assets/images/logo-dark.png" alt="" class="img-fluid mb-4">
                                <h4 class="mb-3 f-w-400">Login</h4>
                                <div class="form-group mb-3">
                                    <label class="floating-label" for="Email">UserName</label>
                                    <asp:TextBox class="form-control" id="user" runat="server"></asp:TextBox>
                                </div>
                                <div class="form-group mb-4">
                                    <label class="floating-label" for="Password">Password</label>
                                    <asp:TextBox type="password" class="form-control" id="Password" runat="server"></asp:TextBox>
                                </div>
                                <asp:Button class="btn btn-block btn-primary mb-4" ID="Signin" runat="server" Text="Login" OnClick="Signin_Click" />
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- [ auth-signin ] end -->

    <!-- Required Js -->
    <script src="assets/js/vendor-all.min.js"></script>
    <script src="assets/js/plugins/bootstrap.min.js"></script>
    <script src="assets/js/ripple.js"></script>
    <script src="assets/js/pcoded.js"></script>
</body>
</html>
