<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Sales Summary Report</title>
	
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
        
                    <!-- /.dropdown-tasks -->
             
                <!-- /.dropdown -->
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
			 <div class="panel-body">
                            <div class="row">
                                    <form role="form">
										<form role="form">
										 
										<div class="form-group">
                                            <label>Sort By:</label>
                                            <select class="form-control">
                                                <option>Monthly</option>
                                                <option>Yearly</option>
                                            </select>
											<div align = "right">
										<input type = "button" value = "Sort" class="btn btn-primary active" onClick="Update Sales Invoice List('dataTable')">
										</div>
                                        </div>
										
										<div class="panel-body">
													<div class="table-responsive">
														<table class="table" id = dataTable">
														<thead>
															<tr>
																<th>Product Code</th>
																<th>Description</th>
																<th>Effective Subtotal</th>
																<th>Effective Cost</th>
																<th>Estimated Profit</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<td>XXXXXXXXXXXXXXX	
																</td>
																<td>XXXXXXXXXXXXXXX</td>
																<td>XXXXXXXXXXXXXXX</td>
																<td>ZZZZZ9.99</td>
																<td>ZZZZZ9.99</td>
															</tr>
															<tr>
																<td>XXXXXXXXXXXXXXX	
																</td>
																<td>XXXXXXXXXXXXXXX</td>
																<td>XXXXXXXXXXXXXXX</td>
																<td>ZZZZZ9.99</td>
																<td>ZZZZZ9.99</td>
															</tr>
															<tr>
																<td>XXXXXXXXXXXXXXX	
																</td>
																<td>XXXXXXXXXXXXXXX</td>
																<td>XXXXXXXXXXXXXXX</td>
																<td>ZZZZZ9.99</td>
																<td>ZZZZZ9.99</td>
															</tr>
														</tbody>
											</table>
									<input type = "button" value = "Print" class="btn btn-primary active" onClick="Update Sales Invoice List('dataTable')">
                            </div>
                            <!-- /.table-responsive -->
                        </div>
								<div class="row">
										
                    <!-- /.panel -->
										
                                       
                                <!-- /.col-lg-6 (nested) -->
                                  
                            </div>
                            <!-- /.row (nested) -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
					</div>
                                       
                                </div>
                                <!-- /.col-lg-6 (nested) -->
                                  
                            </div>
                            <!-- /.row (nested) -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="bower_components/jquery/dist/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="bower_components/metisMenu/dist/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="dist/js/sb-admin-2.js"></script>
</body>

</html>
