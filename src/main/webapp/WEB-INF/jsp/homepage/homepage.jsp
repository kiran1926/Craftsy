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
                <h5>"Earthen Stories"</h5>
                <p>Each pot whispers tales of generations past, of skilled hands shaping clay into art.</p>
              </div>
            </div>
            <div class="carousel-item">
              <img src="/pub/images/slider/image-7.jpg" class="d-block w-100" alt="..."
                   height="500px" style="border-radius: 10px;">
              <div class="carousel-caption d-none d-md-block">
                <h5>"Hands of Creation"</h5>
                <p>The artisan's hands bring life to the clay, shaping it into a work of art.</p>
              </div>
            </div>
            <div class="carousel-item">
              <img src="/pub/images/slider/image-3.jpg" class="d-block w-100" alt="..."
                   height="500px" style="border-radius: 10px;">
              <div class="carousel-caption d-none d-md-block">
                <h5>"A Tapestry of Textures"</h5>
                <p>Feel the legacy of generations in every touch of these handcrafted pieces.</p>
              </div>
            </div>
            <div class="carousel-item">
              <img src="/pub/images/slider/image-4.jpg" class="d-block w-100" alt="..."
                   height="500px" style="border-radius: 10px;">
              <div class="carousel-caption d-none d-md-block">
                <h5>"Woven Wonders" </h5>
                <p>These handcrafted pieces echo the rich cultural heritage of their makers.</p>
              </div>
            </div>
            <div class="carousel-item">
              <img src="/pub/images/slider/image-5.jpg" class="d-block w-100" alt="..."
                   height="500px" style="border-radius: 10px;">
              <div class="carousel-caption d-none d-md-block">
                <h5>"Divine Creation" </h5>
                <p>The artist's hands breathe life into stone, shaping the divine form of Ganesha.</p>
              </div>
            </div>
            <div class="carousel-item">
              <img src="/pub/images/slider/image-2.jpg" class="d-block w-100" alt="..."
                   height="500px" style="border-radius: 10px;">
              <div class="carousel-caption d-none d-md-block">
                <h5>"Stitched Stories"</h5>
                <p>Each stitch tells a story, a testament to the patience and artistry of the embroiderer.</p>
              </div>
            </div>
            <div class="carousel-item">
              <img src="/pub/images/slider/image-1.jpg" class="d-block w-100" alt="..."
                   height="500px" style="border-radius: 10px;">
              <div class="carousel-caption d-none d-md-block">
                <h5>"A Potpourri of Colors"</h5>
                <p>The collection of vases, with their rich colors and intricate details, creates a visual feast that is both inspiring and captivating.</p>
              </div>
            </div>
            <div class="carousel-item">
              <img src="/pub/images/slider/image-8.jpg" class="d-block w-100" alt="..."
                   height="500px" style="border-radius: 10px;">
              <div class="carousel-caption d-none d-md-block">
                <h5>"Threads of Tradition"</h5>
                <p>Experience the rich heritage of Indian textiles with our collection of handcrafted sarees.</p>
              </div>
            </div>
            <div class="carousel-item">
              <img src="/pub/images/slider/image-11.jpg" class="d-block w-100" alt="..."
                   height="500px" style="border-radius: 10px;">
              <div class="carousel-caption d-none d-md-block">
                <h5>"Bringing Form to Life"</h5>
                <p>Capturing the moment where the artist's imagination takes shape in the clay.</p>
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
      <div class="container d-flex flex-column col-4 justify-content-center card-sh" style="background-color: white; border-radius: 10px;">
        <div class="p-2">
        <h1 class="m-0  text-center align-items-center" style="color: #711A4E">Discover Unique Handmade Crafts</h1>
        </div>
        <div class="p-2 pt-5">
        <p class="m-0 text-center align-items-center" style="font-size: larger">Connect with artisans and support their creativity.</p>
        </div>
        <div class="p-2 pt-5">
          <p class="m-0 text-center align-items-center" style="font-size: x-large; color: #961362" ><a aria-current="page" href="/products" style="color: #961362"> Shop Now</a> <i class="fa-solid fa-arrow-right"></i></p>
        </div>
      </div>

    </div>
  </div>
</section>

<section>
  <div class="container-outer mt-4 card-sh" style="background-color: white">
    <div class="container pt-3 pb-5">
      <div class="row pt-3">
        <p class="text-center fs-2 pb-1" style="color: #711A4E"> Featured Categories
        <hr style="color: #711A4E; font-weight: bolder">
        </p>
        <div class="col-md-4">
          <div class="card card-sh body-bg" style="border-radius: 10px">
            <div class="card-body text-center">
              <a href="/products/category?category=Pottery">
              <img src="/pub/images/slider/pots-4.jpg" width="370px" height="300px"
                   style="border-radius: 10px; margin-top: 10px"></a>
              <p class="featured-item" style="font-size: x-large; padding-top: 20px;"><a href="/products/category?category=Pottery" style="color: #711A4E">Pottery</a></p>
            </div>
          </div>
        </div>

        <div class="col-md-4">
          <div class="card card-sh body-bg" style="border-radius: 10px">
            <div class="card-body text-center">
              <a href="/products/category?category=Bamboo%20Artifacts">
              <img src="/pub/images/slider/basket-2.jpg" width="370px" height="300px"
                   style="border-radius: 10px; margin-top: 10px"></a>
              <p class="featured-item" style="font-size: x-large; padding-top: 20px;"><a href="/products/category?category=Bamboo%20Artifacts" style="color: #711A4E">Bamboo Artifact</a></p>
            </div>
          </div>
        </div>

        <div class="col-md-4">
          <div class="card card-sh body-bg" style="border-radius: 10px">
            <div class="card-body text-center">
              <a href="/products/category?category=Paintings">
              <img src="https://m.media-amazon.com/images/I/619xiu6G68L._AC_UF894,1000_QL80_.jpg " width="370px" height="300px"
                   style="border-radius: 10px; margin-top: 10px"></a>
              <p class="featured-item" style="font-size: x-large; padding-top: 20px;"><a href="/products/category?category=Paintings" style="color: #711A4E">Paintings</a></p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<jsp:include page="../include/footer.jsp"/>