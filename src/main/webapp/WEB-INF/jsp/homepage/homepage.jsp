<%-- JSTL --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="../include/header.jsp"/>

<section class="body-bg pt-5 pb-5">
  <div class="container">
    <div class="row">
      <h1 class="m-0 text-center">Discover Unique Handmade Crafts</h1>
      <p class="m-0 text-center">Connect with artisans and support their creativity.</p>
    </div>
  </div>
</section>

<%--this section is half and half- image on one side and text on the other--%>
<section>

</section>

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

<jsp:include page="../include/footer.jsp"/>