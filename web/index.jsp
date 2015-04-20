
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Log In</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/stylish-portfolio.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
	
</head>

<body>

    <!-- Header -->
   
    <form action="/APPServlet/logIn" method="POST">
        <header id="top" class="header">
         <div class="text-vertical-center">
			<div align="center">
				<img src="logo.jpg" class="img-responsive" alt="Cinque Terre" width="100" height="150" align="center">
			</div>
            <h1>Lifestyle Interiors</h1><br>
            <h3>Username</h3>
					<input type="text" name = "username" class="text-center" id="pass" size="2" maxlength="100" style="width: 300px; height: 30px;"/>
			<br>
			<h3>Password</h3>
					<input type="password" name = "password" class="text-center" id="pass" size="2" maxlength="100" style="width: 300px; height: 30px;"/>
            <br><br>
            <input type ="submit" class="btn btn-dark btn-lg">
        </div>
             </header>
   </form>

            
            
  
    <!-- Footer -->
    <footer>
        <div class="container">
            <div class="row">
                <div class="col-lg-10 col-lg-offset-1 text-center">
                    <h4><strong>Lifestyle Interiors</strong>
                    </h4>
                    <p>274-8 A.Mabini,Caloocan City<br>Philippines</p>
                    <ul class="list-unstyled">
                        <li><i class="fa fa-phone fa-fw"></i>(02) 287-0045</li>
						<li><i class="fa fa-phone fa-fw"></i>(0920) 054-8888 </li>
                        <li><i class="fa fa-envelope-o fa-fw"></i>  <a href="mailto:name@example.com">lifestyleInteriors@yahoo.com</a>
                        </li>
                    </ul>
                    <br>
                    <ul class="list-inline">
                        <li>
                            <a href="#"><i class="fa fa-facebook fa-fw fa-3x"></i></a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-twitter fa-fw fa-3x"></i></a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-dribbble fa-fw fa-3x"></i></a>
                        </li>
                    </ul>
                    <hr class="small">
                    <p class="text-muted">Copyright &copy; Website 2014</p>
                </div>
            </div>
        </div>
    </footer>

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>


</body>

</html>

