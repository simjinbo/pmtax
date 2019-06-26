<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>introduction</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.2/css/all.css"
	integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr"
	crossorigin="anonymous">
<link rel="stylesheet" href="resources/css/templatemo-style.css" />
<link rel="stylesheet" href="resources/slick/slick.css">
<link rel="stylesheet" href="resources/slick/slick-theme.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.min.js"></script>
<style type="text/css">
.jumbotron {
background-image:url('${pageContext.request.contextPath}/resources/images/2.jpg');
background-size:cover;
}
</style>
</head>
<body>

	<div class="container">
		<div class="jumbotron text-center">
		<h1>ABOUT</h1>
		</div>
		<div class="row">
			<div class="col-lg-6">
				<img src="${pageContext.request.contextPath}/resources/images/1.jpg"
					alt="Image" class="img-fluid tm-intro-img" />
			</div>
			<div class="col-lg-6">
				<div class="tm-intro-text-container">
					<h2 class="tm-text-primary mb-4 tm-section-title">안녕하세용!</h2>
					<p class="mb-4 tm-intro-text">
						The Town is <strong>simple CSS template</strong> built on
						Bootstrap v4.1.3 and this is a little parallax layout that you can
						use for your websites.
					</p>
					<p class="mb-5 tm-intro-text">
						Please tell your friends about our site <a rel="nofollow"
							href="https://templatemo.com">templatemo</a>. Thank you.
						Curabitur dapibus tristique enim a imperdiet. Etiam tristique sem
						sed condimentum posuere.
					</p>
					<div class="tm-next">
						<a href="#work" class="tm-intro-text tm-btn-primary">편집</a>
					</div>
				</div>
			</div>
		</div><!-- row -->
		
	<!-- 	<div class="row tm-section-pad-top">
          <div class="col-lg-4">
            <i class="fas fa-4x fa-bus text-center tm-icon"></i>
            <h4 class="text-center tm-text-primary mb-4">Curabitur at elit eu risus</h4>
            <p>
              Sed ultrices sit amet mi eu malesuada. Cras ultricies gravida
              nisi, ac pellentesque nunc tincidunt quis. Aenean at ornare lacus.
              Duis imperdiet lacus justo.
            </p>
          </div>
        
        <div class="col-lg-4 mt-5 mt-lg-0">
          <i class="fas fa-4x fa-bicycle text-center tm-icon"></i>
          <h4 class="text-center tm-text-primary mb-4">Nunc sed metus vel nisi</h4>
          <p>
            Praesent ut finibus leo. Duis et tempus ipsum, id pretium nunc.
            Vivamus imperdiet sem quis orci pharetra convallis. Nunc a tempus
            nisi, sed fringilla purus. In hac habitasse platea.
          </p>
        </div>
        <div class="col-lg-4 mt-5 mt-lg-0">
          <i class="fas fa-4x fa-city text-center tm-icon"></i>
          <h4 class="text-center tm-text-primary mb-4">Fusce sed nisi sagittis</h4>
          <p>
            Donec vestibulum libero nisl. Curabitur ac orci ac lorem blandit
            volutpat. Sed ac sodales nibh, ut porttitor elit. Sed id dui mi.
            Vestibulum ante ipsum primis in faucibus.
          </p>
        </div>
      </div> -->
		
	<div class="row" style=" margin-top:5%;">
            <div class="col-12">
                <h2 class="mb-4 tm-section-title">Contact Us</h2>
                <div class="mb-5 tm-underline" style="background:#8f8f8f">
                  <div class="tm-underline-inner" style="background:#8f8f8f"></div>
                </div>
                <p class="mb-5">
                  Nullam tincidunt, lacus a suscipit luctus, elit turpis tincidunt dui,
                  non tempus sem turpis vitae lorem. Maecenas eget odio in sapien ultrices
                  at at velit.
                </p>
            </div>
            
            <div class="col-sm-12 col-md-6 d-flex align-items-center tm-contact-item">
              <a href="tel:01002200340" >
                  <i class="fas fa-3x fa-phone mr-4"></i>
                  <span class="mb-0">010-0220-0340</span>
              </a>              
            </div>
            <div class="col-sm-12 col-md-6 d-flex align-items-center tm-contact-item">
              <a href="mailto:info@company.co" >
                  <i class="fas fa-3x fa-envelope mr-4"></i>
                  <span class="mb-0">info@company.co</span>
              </a>              
            </div>
            <div class="col-sm-12 col-md-6 d-flex align-items-center tm-contact-item">
              <a href="https://www.google.com/maps">
                  <i class="fas fa-3x fa-map-marker-alt mr-4"></i>
                  <span class="mb-0">Location on Maps</span>
              </a>              
            </div>
        </div>
		
		
	</div><!-- container -->

</body>
</html>