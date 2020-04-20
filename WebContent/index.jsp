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
				<!-- start of slider-->
				<div class="slider">
					<ul>
						<li>
							<a href="flavors.jsp"><img src="images/fruit-toppings.gif" width="680" height="200" alt="Frosty Sweet" title="Frosty Sweet"></a>
						</li>
					</ul>
					<div class="footer">
						<ul>
							<li>
								<a href="flavors.jsp"><img src="images/button-slider1.gif" width="24" height="24" alt="Frosty Sweet" title="Frosty Sweet"></a>
							</li>
							<li>
								<a href="flavors.jsp"><img src="images/button-slider2.gif" width="24" height="24" alt="Frosty Sweet" title="Frosty Sweet"></a>
							</li>
							<li>
								<a href="flavors.jsp"><img src="images/button-slider3.gif" width="24" height="24" alt="Frosty Sweet" title="Frosty Sweet"></a>
							</li>
						</ul>
					</div>
				</div>
				<!-- end of slider --> 
				<!-- start of featured-->
				<div class="featured">
					<ul>
						<li>
							<a href="flavors.jsp"><img src="images/free-ice-cream-sampling.jpg" width="340" height="167" alt="Frosty Sweet" title="Frosty Sweet"></a>
							<h2><a href="flavors.jsp">Free Ice Cream Sampling</a></h2>
						</li>
						<li>
							<a href="flavors.jsp"><img src="images/ice-cream-for-occasions.jpg" width="340" height="167" alt="Frosty Sweet" title="Frosty Sweet"></a>
							<h2><a href="flavors.jsp">Ice Cream For Every Occasion</a></h2>
						</li>
						<li>
							<a href="flavors.jsp"><img src="images/fat-free-ice-cream.jpg" width="340" height="167" alt="Frosty Sweet" title="Frosty Sweet"></a>
							<h2><a href="flavors.jsp">Fat Free Ice Cream</a></h2>
						</li>
						<li>
							<a href="flavors.jsp"><img src="images/ice-cream-recipes.jpg" width="340" height="167" alt="Frosty Sweet" title="Frosty Sweet"></a>
							<h2><a href="flavors.jsp">Ice Cream Recipes</a></h2>
						</li>
					</ul>
				</div>
				<!-- end of featured--> 
				<!-- start of section-->
				<div class="section">
					<div class="about">
						<h2><a href="index.jsp">What makes us different?</a></h2>
						<p>
							This website template has been designed by Free Website Templates for you, for free. You can replace all this text with your own text.
						</p>
						<p>
							You can remove any link to our website from this website template, you're free to use this website template without linking back to us.
						</p>
						<p>
							If you're having problems editing this website template, then don't hesitate to ask for help on the <a href="http://www.freewebsitetemplates.com/forums">Forums</a>.
						</p>
						<p>
							Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nulla egestas velit non velit luctus accumsan. Mauris rhoncus, ante ut sodales facilisis, odio urna bibendum augue, ut ullamcorper est purus eget lorem. Praesent cursus dictum sem a dictum.
						</p>
					</div>
					<div class="connect"><a href="index.jsp"><img src="images/sign-board.gif" width="234" height="222" alt=""></a>
						<h2>NEWSLETTER SIGNUP</h2>
						<span>Get the latest news and updates!</span>
						<form>
							<input type="text" id="email" value="Enter your e-mail here..." onblur="this.value=!this.value?'Enter your e-mail here...':this.value;" onfocus="this.select()" onclick="this.value='';">
							<input type="submit" value="">
						</form>
					</div>
				</div>
				<!-- end of section--> 
				<!-- start of article comment-->
				<div class="section">
					<h2>Sweet words from our clients</h2>
					<div class="comment">
						<p>
							"Nullam lorem nulla, ornare ut rutrum eget, dignissim eu dui. Praesent dictum convallis mauris sit amet tincidunt."
						</p>
						<span>J.Smith - California</span></div>
				</div>
				<!-- end of article comment--> 
			</div>
			<!-- end of class content -->
			<jsp:include page="/inc/bottom.jsp"/>
		</div>
		<!-- end of ID content--> 
	</div>
</body>
</html>