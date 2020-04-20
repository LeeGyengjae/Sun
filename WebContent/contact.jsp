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
						<div class="body"><!-- start of body -->
							<h1>Contact Us</h1>
							<ul class="connect">
								<li>
									<h2 class="phone">Call Us</h2>
									<span>755-811-4255</span><span>9am - 5pm CST Monday - Friday</span>
								</li>
								<li>
									<h2 class="email">Email Us</h2>
									<span><a href="mailto:info@frostysweets.com">info@frostysweets.com</a></span>
								</li>
								<li>
									<h2 class="home">Visit Us</h2>
									<span>3550 Breadhouse Avenue Brooklyn, Newyork 45628</span>
								</li>
								<li>
									<h2 class="dollor">For Business Orders</h2>
									<span><a href="mailto:sales@frostysweets.com">sales@frostysweets.com</a></span><span>755-811-4255</span>
								</li>
							</ul>
							<h1>Send Us a Quick Message</h1>
							
							
							<form action="mailsend" method="post">
								<ul class="contact">
									<li class="first">
										<label>Receiver*</label>
										<input type="text" value="info@frostysweets.co" id="receiver" readonly="readonly">
										<label>Name*</label>
										<input type="text" value="" id="subject">
										<label>Email Address*</label>
										<input type="text" value="" id="sender">
									</li>
									<li class="last">
										<label>Message*</label>
										<textarea id="content"></textarea>
										<input type="submit" value="">
									</li>
								</ul>
							</form>
							
						</div>
						<!-- end of body --> 
					</div>
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