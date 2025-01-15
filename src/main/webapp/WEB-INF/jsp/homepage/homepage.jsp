<%-- JSTL --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="../include/header.jsp"/>

<%--load external css --%>
<link href="/pub/css/homepage.css" rel="stylesheet">

<%--this section is half and half- image on one side and text on the other--%>
<section>
  <div class="container-fluid pt-2 pb-2 body-bg">
    <div class="row">
      <div class="col-8">
        <%--  Start slider carousel--%>
        <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
          <div class="carousel-indicators">
            <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
            <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
            <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
            <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="3" aria-label="Slide 4"></button>
            <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="4" aria-label="Slide 5"></button>
            <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="5" aria-label="Slide 6"></button>
            <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="6" aria-label="Slide 7"></button>
            <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="7" aria-label="Slide 8"></button>
            <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="8" aria-label="Slide 9"></button>
          </div>
          <div class="carousel-inner">
            <div class="carousel-item active">
              <img src="/pub/images/slider/image-9.jpg" class="d-block w-100" alt="..."
                   height="500px" style="border-radius: 10px;">
              <div class="carousel-caption d-none d-md-block">
                <h5>First slide label</h5>
                <p>Some representative placeholder content for the first slide.</p>
              </div>
            </div>
            <div class="carousel-item">
              <img src="/pub/images/slider/image-7.jpg" class="d-block w-100" alt="..."
                   height="500px" style="border-radius: 10px;">
              <div class="carousel-caption d-none d-md-block">
                <h5>Second slide label</h5>
                <p>Some representative placeholder content for the second slide.</p>
              </div>
            </div>
            <div class="carousel-item">
              <img src="/pub/images/slider/image-3.jpg" class="d-block w-100" alt="..."
                   height="500px" style="border-radius: 10px;">
              <div class="carousel-caption d-none d-md-block">
                <h5>Third slide label</h5>
                <p>Some representative placeholder content for the third slide.</p>
              </div>
            </div>
            <div class="carousel-item">
              <img src="/pub/images/slider/image-4.jpg" class="d-block w-100" alt="..."
                   height="500px" style="border-radius: 10px;">
              <div class="carousel-caption d-none d-md-block">
                <h5>Third slide label</h5>
                <p>Some representative placeholder content for the third slide.</p>
              </div>
            </div>
            <div class="carousel-item">
              <img src="/pub/images/slider/image-5.jpg" class="d-block w-100" alt="..."
                   height="500px" style="border-radius: 10px;">
              <div class="carousel-caption d-none d-md-block">
                <h5>Third slide label</h5>
                <p>Some representative placeholder content for the third slide.</p>
              </div>
            </div>
            <div class="carousel-item">
              <img src="/pub/images/slider/image-2.jpg" class="d-block w-100" alt="..."
                   height="500px" style="border-radius: 10px;">
              <div class="carousel-caption d-none d-md-block">
                <h5>Third slide label</h5>
                <p>Some representative placeholder content for the third slide.</p>
              </div>
            </div>
            <div class="carousel-item">
              <img src="/pub/images/slider/image-1.jpg" class="d-block w-100" alt="..."
                   height="500px" style="border-radius: 10px;">
              <div class="carousel-caption d-none d-md-block">
                <h5>Third slide label</h5>
                <p>Some representative placeholder content for the third slide.</p>
              </div>
            </div>
            <div class="carousel-item">
              <img src="/pub/images/slider/image-8.jpg" class="d-block w-100" alt="..."
                   height="500px" style="border-radius: 10px;">
              <div class="carousel-caption d-none d-md-block">
                <h5>Third slide label</h5>
                <p>Some representative placeholder content for the third slide.</p>
              </div>
            </div>
            <div class="carousel-item">
              <img src="/pub/images/slider/image-11.jpg" class="d-block w-100" alt="..."
                   height="500px" style="border-radius: 10px;">
              <div class="carousel-caption d-none d-md-block">
                <h5>Third slide label</h5>
                <p>Some representative placeholder content for the third slide.</p>
              </div>
            </div>
          </div>
          <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
          </button>
          <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
          </button>
        </div>
      </div>

<%--      some text on the right of carousel      --%>
      <div class="container d-flex flex-column col-4 body-bg justify-content-center" style="background: white; border-radius: 10px">
        <div class="p-2">
        <h1 class="m-0  text-center align-items-center">Discover Unique Handmade Crafts</h1>
        </div>
        <div class="p-2 pt-5">
        <p class="m-0 text-center align-items-center" style="font-size: larger">Connect with artisans and support their creativity.</p>
        </div>
        <div class="p-2 pt-5">
          <p class="m-0 text-center align-items-center" style="font-size: x-large">Shop Now <i class="fa-solid fa-arrow-right"></i></p>
        </div>
      </div>

    </div>
  </div>
</section>

<%-- category  module--%>
<section class="container" style="font-family: 'Quicksand',sans-serif; background-color: white; border-radius: 10px; padding-left: 20px; padding-right: 20px;">
  <div class="featured mb-5 mt-5">
    <h3 class="text-center mb-4">Featured Categories</h3>
    <div class="row">
      <div class="col-md-4">
        <img src="https://images.pexels.com/photos/15638826/pexels-photo-15638826/free-photo-of-fusion-of-craft.jpeg" style="height:300px; width:400px; padding-left: 7px; border-radius: 15px"class="img-fluid rounded" alt="pottery">
        <h5 class="text-center mt-2">Pottery</h5>
      </div>
      <div class="col-md-4">
        <img src="https://images.pexels.com/photos/27330697/pexels-photo-27330697/free-photo-of-colorful-bags.jpeg"
             style="height:300px; width:400px; border-radius: 10px" class="img-fluid rounded" alt="bamboo">
        <h5 class="text-center mt-2">Bamboo Baskets</h5>
      </div>
      <div class="col-md-4">
        <img src="https://m.media-amazon.com/images/I/619xiu6G68L._AC_UF894,1000_QL80_.jpg " style="height:300px; width:400px; border-radius: 15px" class="img-fluid rounded" alt="Paintings">
        <h5 class="text-center mt-2">Paintings</h5>
      </div>
    </div>
  </div>
</section>

<section>
  <div class="container">
    <div class="d-flex flex-row">
      <p class="text-center fs-4">Category</p>
      <div class="col-md-2">
        <div class="card">
          <div class="card-body text-center">
            <img src="img/category.png" width="90%" height="200px">
            <p></p>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<jsp:include page="../include/footer.jsp"/>