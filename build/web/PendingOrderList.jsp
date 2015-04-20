<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Pending Order List</title>
    
    <link href = "//cdn.datatables.net/1.10.6/css/jquery.dataTables.min.css" rel = "stylesheet">
	
    <!-- Bootstrap Core CSS -->
    <link href="bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">

    <!-- Timeline CSS -->
    <link href="dist/css/timeline.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="bower_components/morrisjs/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
	
   
</head>

<body>

    <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
				<a class="navbar-brand" href="index.html">Admin</a>
			    <img src="logo.jpg" class="img-responsive" alt="Cinque Terre" width="50" height="50" align="center">
			</div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">
               
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"></i>  <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="#"><i class="fa fa-user fa-fw"></i> User Profile</a>
                        </li>
                        <li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="login.html"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                        </li>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
            </ul>
            <!-- /.navbar-top-links -->

            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        
                        <li>
                            <a href="<c:url value = "/sales" />"><i class="fa fa-home fa-fw"></i> Home</a>
                        </li>
						<li>
                            <a href="<c:url value = "/new-sales-invoice" />"><i class="fa fa-plus fa-fw"></i> New Sales Invoice</a>
                        </li>
						<li>
                            <a href="<c:url value = "/new-purchase-order" />"><i class="fa fa-plus fa-fw"></i> New Purchase Order</a>
                        </li>
						<li>
                            <a href="<c:url value = "/invoice-list"/>"><i class="fa fa-list-alt fa-fw"></i> Sales Invoice List</a>
                        </li>
						<li>
                            <a href="<c:url value = "/pending-orders" />"><i class="fa fa-list-alt fa-fw"></i> Pending Order List</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> Sales Report<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="SalesSummaryReport.jsp">Sales Summary Report</a>
                                </li>
                                <li>
                                    <a href="ProductSalesBreakdown.jsp">Product Sales Breakdown</a>
                                </li>
					
                            </ul>
                        </li>
                        
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>

		 <div id="page-wrapper">
            <div class="container-fluid">
                <div class="col-sm-4">
                    <h1 class="page-header">Pending Orders</h1>
                </div>
                <div class="col-sm-4"></div>
                <div class="col-sm-1"></div>
                <div class="col-sm-3">
                    <br><br><br><br><br>
                    
                </div>
            </div>
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <br><br><br>
                        <div class="panel-body">
                             <div class="table-responsive">
                             <table class="table table-striped table-bordered table-hover" id="dataTable">
                                 <thead>
                                     <tr>
                                         <th>Sales Invoice Number</th>
                                         <th>Delivery Date</th>
                                         <th>Customer Contact Number</th>
                                         <th>Status</th>
					 <th>Open Details</th>
                                     </tr>
                                 </thead>
                                 
                                 <c:forEach var = "order" items = "${orders}">
                                     <tr>
                                         <td><fmt:formatNumber pattern="0000" value="${order.orderID}"/></td>
                                         <td><c:out value = "${order.orderDate}"/></td>
                                         <td><c:out value = "${order.customerContact}"/></td>
                                         <!--Since pending naman sya, hardcode na lang natin.-->
                                         <td>Pending</td>
                                         <td><a href = "/open" class = "button">Open</a></td>
                                     </tr>
                                 </c:forEach>
                             </table>
                             
                         </div>
                     </div>
                        
                    </div>
                </div>
            </div>
			<div align = "right">
				<input type = "button" value = "Print" class="btn btn-primary active" onClick="Update Sales Invoice List('dataTable')">
			</div>
        </div>
        </div>

    <!-- jQuery -->
    <script src="bower_components/jquery/dist/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="bower_components/metisMenu/dist/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="dist/js/sb-admin-2.js"></script>
    
    <!-- -->
    
    <script src="//cdn.datatables.net/1.10.6/js/jquery.dataTables.min.js"></script>
    
    <script> 
        $(document).ready(function(){    
            $('#dataTable').DataTable();
        });
    </script>

</body>

</html>
