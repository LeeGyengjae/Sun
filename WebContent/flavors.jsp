<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<jsp:include page="/inc/head.jsp"/>
</head>
<body>
	<div id="page">
		<jsp:include page="/inc/slider.jsp"/>
		<div id="content"> 
			<!-- start of header -->
			<jsp:include page="/inc/top.jsp"/>
			<!-- end of header --> 
			<!-- start of class content -->
			<div class="content"> 
				<!-- start inner page content box background -->
				<div class="header">
					<div class="footer">
						<div class="body">
							<h1>Choose Your Flavors</h1>
							<div class="section">
								<ul class="flavors">
									<li>
										<img src="images/strawberry-delight.jpg" width="130" height="130" alt="" title="">
										<h2>Strawberry Delight</h2>
										<input type="text" value="">
										<span>Quality</span>
									</li>
									<li>
										<img src="images/ube-adventure.jpg" width="130" height="130" alt="" title="">
										<h2>Ube Adventure</h2>
										<input type="text" value="">
										<span>Quality</span>
									</li>
									<li>
										<img src="images/sweet-cheese.jpg" width="130" height="130" alt="" title="">
										<h2>Sweet Cheese</h2>
										<input type="text" value="">
										<span>Quality</span>
									</li>
									<li>
										<img src="images/bubblegum-bomb.jpg" width="130" height="130" alt="" title="">
										<h2>Bubblegum Bomb</h2>
										<input type="text" value="">
										<span>Quality</span>
									</li>
									<li>
										<img src="images/blueberry-explosion.jpg" width="130" height="130" alt="" title="">
										<h2>Blueberry Explosion</h2>
										<input type="text" value="">
										<span>Quality</span>
									</li>
									<li>
										<img src="images/coconut-pleasure.jpg" width="130" height="130" alt="" title="">
										<h2>Coconut Pleasure</h2>
										<input type="text" value="">
										<span>Quality</span>
									</li>
									<li>
										<img src="images/pistachio-craze.jpg" width="130" height="130" alt="" title="">
										<h2>Pistachio Craze</h2>
										<input type="text" value="">
										<span>Quality</span>
									</li>
									<li>
										<img src="images/citrus-love.jpg" width="130" height="130" alt="" title="">
										<h2>Citrus Love</h2>
										<input type="text" value="">
										<span>Quality</span>
									</li>
								</ul>
							</div>
							<div class="section">
								<h2>Check Your Orders and Bill</h2>
								<!-- start of orders -->
								<div id="orders">
									<h2>&nbsp;</h2>
									<div>
										<table>
											<tr>
												<td><a href="#">&nbsp;</a></td>
												<td>Strawberry Delight</td>
												<td>x 1</td>
												<td class="last">20.50</td>
											</tr>
											<tr>
												<td><a href="#">&nbsp;</a></td>
												<td>Ube Adventure</td>
												<td>x 3</td>
												<td class="last">61.50</td>
											</tr>
											<tr>
												<td><a href="#">&nbsp;</a></td>
												<td>Sweet Cheese</td>
												<td>x 7</td>
												<td class="last">143.50</td>
											</tr>
											<tr>
												<td><a href="#">&nbsp;</a></td>
												<td>Bubblegum Bomb</td>
												<td>x 2</td>
												<td class="last">41.00</td>
											</tr>
										</table>
										<table class="last">
											<tr>
												<td>&nbsp;</td>
												<td>&nbsp;</td>
												<td class="first">Subtotal</td>
												<td class="last">266.50</td>
											</tr>
											<tr>
												<td>&nbsp;</td>
												<td></td>
												<td class="first">Delivery Charge</td>
												<td class="last">50.00</td>
											</tr>
											<tr>
												<td>&nbsp;</td>
												<td></td>
												<td class="first">TOTAL</td>
												<td class="last">316.50</td>
											</tr>
										</table>
									</div>
								</div>
								<!-- end of orders -->
								<div class="pricing">
									<h2>Pricing</h2>
									<span>1 pint for $20.50</span><span>1/2 Gallon = 4 pints for $80.50</span><span>Full Gallon = 8 pints for $180.50</span></div>
							</div>
							<form action="#">
								<!-- start of section -->
								<div class="section"> 
									<!-- start of delivery -->
									<div class="delivery">
										<h2>Delivery Information</h2>
										<table>
											<tr>
												<td><label for="firstname"><span>First Name*</span>
														<input type="text" name="firstname" id="firstname" value="">
													</label></td>
												<td><label for="address1"><span>Street Address 1 *</span>
														<input type="text" name="street address 1" id="address1">
													</label></td>
											</tr>
											<tr>
												<td><label for="lastname"><span>Last Name *</span>
														<input type="text" name="lastname" id="lastname" value="">
													</label></td>
												<td><label for="address2"><span>Street Address 2 *</span>
														<input type="text" name="address2" id="address2" value="">
													</label></td>
											</tr>
											<tr>
												<td><label for="contactnumber"><span>Contact Number *</span>
														<input type="text" name="contactnumber" id="contactnumber" value="">
													</label></td>
												<td><label for="city"><span class="city">City *</span>
														<select name="city" id="city">
															<option></option>
															<option></option>
														</select>
													</label>
													<label for="state"><span class="state">State *</span>
														<select name="state" id="state">
															<option></option>
															<option></option>
														</select>
													</label></td>
											</tr>
											<tr>
												<td><label for="emailaddress"><span>Email Address *</span>
														<input type="text" name="emailaddress" id="emailaddress" value="">
													</label></td>
												<td><label for="zipcode"><span class="zipcode">Zipcode *</span>
														<input type="text" name="zipcode" id="zipcode" value="">
													</label>
													<label for="phone"><span class="phone">Phone *</span>
														<input type="text" name="phone" id="phone" value="">
													</label></td>
											</tr>
										</table>
									</div>
									<!-- end of delivery --> 
									<!-- start of payment -->
									<div class="payment">
										<h2>Payment Details</h2>
										<label for="paycreditcard" class="paycreditcard">
											<input type="checkbox" name="paycreditcard" value="" id="paycreditcard" checked>
											Pay Using Credit Card</label>
										<table>
											<tr>
												<td class="first"><label for="creditcard">Credit Card *
														<input type="text" name="creditcard" value="" id="creditcard" class="first">
													</label></td>
												<td><label for="cardnumber">Card Number *
														<input type="text" name="cardnumber" id="cardnumber" value="">
													</label></td>
											</tr>
										</table>
										<table>
											<tr>
												<td><label for="month"><span>Credit Card Expiration *</span>
														<select name="month" id="month">
															<option selected>Month</option>
														</select>
													</label>
													<label for="year"><span>&nbsp;</span>
														<select name="year" id="year">
															<option selected>Year</option>
														</select>
													</label></td>
												<td></td>
											</tr>
										</table>
										<label for="cashondelivery">
											<input type="checkbox" value="" name="cashondelivery" id="cashondelivery" checked>
											Cash on Delivery</label>
									</div>
									<!-- end of payment --> 
								</div>
								<!-- end of section -->
								<div id="connect">
									<input type="submit" value="">
								</div>
							</form>
						</div>
					</div>
					<!-- end of footer--> 
				</div>
				<!-- end inner page content box background --> 
			</div>
			<!-- end of class content -->
			<jsp:include page="/inc/bottom.jsp"/>
		</div>
		<!-- end of ID content--> 
	</div>
</body>
</html>