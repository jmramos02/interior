<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Sales Invoice</title>
	
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
	
	<script>
		function addRow(tableID)
	{
	var table=document.getElementById(tableID);
	var rowCount=table.rows.length;
	var row=table.insertRow(rowCount);
	var column1=row.insertCell(0);
	var element1=document.createElement("input");
	element1.type="text";
	element1.name="text[]";
	column1.appendChild(element1);
	column1.innerHTML = "ll";
	var column2=row.insertCell(1);
	column2.innerHTML="XXXXXXXXXXXXXXX";
	var column3=row.insertCell(2);
	var element2=document.createElement("label");
	element2.type="label";
	element2.name="label[]";
	column3.appendChild(element2);
	column3.innerHTML="ZZZZZ9.99";
	var column4=row.insertCell(3);
	var element3=document.createElement("label");
	element3.type="label";
	element3.name="label[]";
	column4.appendChild(element3);
	column4.innerHTML="ZZZZZ9.99";
	var column5=row.insertCell(2);
	var element4=document.createElement("label");
	element4.type="label";
	element4.name="label[]";
	column5.appendChild(element4);
	column5.innerHTML="Column 3";
	}
        
        function clicked()
                {
                    var x;
                    if(confirm("Are you sure you to proceed?") == true)
                    {
                       x = "Item added!";
                    }
                     else {
                         x = "Item wasn't added";
                     }
                     document.getElementById("demo").innerHTML = x;
                    
                }
        
	</script>

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
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Sales Invoice</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
			
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
							<div class="form-inline">
								<!--<div class="input-group custom-search-form">
									<input type="text" class="form-control" placeholder="Search Invoice Number">
									<span class="input-group-btn">
									<button class="btn btn-default" type="button">
                                    <i class="fa fa-search"></i>
									</button>
								</span>
								</div>-->
							<!--	<label align="pull-right">Sales Invoice Number:12345 (AUTO GENERATED)</label> -->
                            </div>
                        </div>
						
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6">
                                    <form role="form">
										 <div class="form-group">
                                         
                                        </div>
										<div class="form-group">
                                            <label>Sold to</label>
                                            <select class="form-control">
                                                <c:forEach var = "customer" items = "${customers}">
                                                    <option value = ""> <c:out value="${customer.customerFirstName}"/> </option>
                                                </c:forEach>
                                            </select>
                                        </div>
									<!--	<div>
											<label><b>Address: </b></label>
											<p>1234 Apolinario St. Malate Manila (AUTO GENERATED)</p>
										</div>
										<div>
											<label><b>Contact Number: </b></label>
											<p>09261455789 (AUTO GENERATED)</p>
										</div> -->
										
										<div>
											<label>Delivery Date:</label>
										</div>
										
										
										
										<div class="row">
										<div class="panel panel-default">
										<div class="panel-heading" align = "center">
											<h3>Order List</h3>
										</div>
										<!-- /.panel-heading -->
												<div class="panel-body">
													<div class="table-responsive">
														<table class="table table-striped table-bordered table-hover" id = "dataTable">
														<thead>
															<tr>
																<th>Product Code</th>
																<th>Product Description</th>
																<th>Quantity</th>
																<th>Unit Price</th>
																<th>Amount</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<td data-field="id">
																		<label for="qty"></label>
																		<input type="text" id="qty" size="5" maxlength="100" name = "productCode"/>
																</td>
																<td>XXXXXXXXXXXXXXX</td>
																<td data-field="id">
																		<label for="qty"></label>
																		<input type="text" id="qty" size="3" maxlength="100"/>
																</td>
																<td>ZZZZZ9.99</td>
																<td>ZZZZZ9.99</td>
															</tr>
															<tr>
																<td data-field="id">
																		<label for="qty"></label>
																		<input type="text" id="qty" size="5" maxlength="100"/>
																</td>
																<td>XXXXXXXXXXXXXXX</td>
																<td data-field="id">
																		<label for="qty"></label>
																		<input type="text" id="qty" size="3" maxlength="100"/>
																</td>
																<td>ZZZZZ9.99</td>
																<td>ZZZZZ9.99</td>
															</tr>
															<tr>
																<td data-field="id">
																		<label for="qty"></label>
																		<input type="text" id="qty" size="5" maxlength="100"/>
																</td>
																<td>XXXXXXXXXXXXXXX</td>
																<td data-field="id">
																		<label for="qty"></label>
																		<input type="text" id="qty" size="3" maxlength="100"/>
																</td>
																<td>ZZZZZ9.99</td>
																<td>ZZZZZ9.99</td>
															</tr>
														</tbody>
											</table>
											
											<input type = "button" value = "Add Row" class="btn btn-primary active" onClick="addRow('dataTable')">
                            </div>
                            <!-- /.table-responsive -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
										
										
										<div align = "right">
					
                                                                                <button type="button" id="addProduct" class="btn btn-primary active" onclick="clicked()">Update Sales Invoice List</button>
                                                                                
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
