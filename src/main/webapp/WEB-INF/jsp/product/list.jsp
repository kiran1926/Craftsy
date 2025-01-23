<%-- JSTL --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="../include/header.jsp"/>
<%--load external signup css --%>
<link href="/pub/css/list.css" rel="stylesheet">

<section>
    <div class="container-fluid mt-0">
        <div class="row">
            <div class="col-md-2 p-0">
                <div class="card shadow-sm pb-0 mb-5 bg-body-tertiary rounded body-bg" style="border-radius: 10px;">
                    <div class="card-body">
                        <div class="list-group" style="border-radius: 10px;">
                            <a href="/products" class="list-group-item list-group-item-action active" style="background-color: #711A4E" aria-current="true">
                                Categories </a>
                            <a href="/products/category?category=Pottery" class="list-group-item list-group-item-action" style="color: #711A4E">Pottery</a>
                            <a href="/products/category?category=Bamboo%20Artifacts" class="list-group-item list-group-item-action" style="color: #711A4E">Bamboo Artifacts</a>
                            <a href="/products/category?category=Paintings" class="list-group-item list-group-item-action" style="color: #711A4E">Paintings</a>
                            <a href="/products/category?category=Sculptures" class="list-group-item list-group-item-action" style="color: #711A4E">Sculptures</a>
                            <a href="/products/category?category=Wall%20Hangings" class="list-group-item list-group-item-action" style="color: #711A4E">Wall Hangings</a>
                            <a href="/products/category?category=Cultural%20Handicrafts" class="list-group-item list-group-item-action" style="color: #711A4E">Cultural Handicrafts</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-10">
                <div class="card shadow-sm p-3 mb-5 bg-body-tertiary rounded body-bg">
                    <div class="card-body">
                        <p class="fs-3 text-center" style="color: #711A4E; font-size:200px; font-weight: bolder">Products</p>
                        <hr>

                        <!-- Error/Message Section -->
                        <div class="messages">
                            <c:if test="${not empty error}">
                            <div class="toast-container">
                                <div class="toast" role="alert" aria-live="assertive" aria-atomic="true">
                                    <div class="toast-header">
                                        <img src="..." class="rounded me-2" alt="...">
                                        <strong class="me-auto">Bootstrap</strong>
                                        <small class="text-muted">just now</small>
                                        <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
                                    </div>
                                    <div class="toast-body">
                                        Product failed to add to cart.
                                    </div>
                                </div>
                                </c:if>
                                <c:if test="${not empty message}">
                                <div class="toast-container">
                                    <div class="toast" role="alert" aria-live="assertive" aria-atomic="true">
                                        <div class="toast-header">
                                            <img src="..." class="rounded me-2" alt="...">
                                            <strong class="me-auto">Bootstrap</strong>
                                            <small class="text-muted">just now</small>
                                            <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
                                        </div>
                                        <div class="toast-body">
                                            Product added to cart.
                                        </div>
                                    </div>
                                    </c:if>
                                </div>
                        <%------------     Product grid      ------------%>

                        <div class="row">
                            <c:forEach var="product" items="${products}">
                                <div class="col-md-3 mt-5 d-flex justify-content-center">
                                    <div class="card">
                                        <div class="card-body text-center pt-3">
                                            <img alt="" src="${product.imageUrl}" width="100%" height="400px"
                                                 style="border-radius: 10px; ">
                                            <p class="fs-5 text-center pt-2 fw-bold ">${product.name}</p>
                                            <div class="row text-center">
                                                <p class="fs-4" >$ ${product.price}</p>
                                                <p class="fs-2card-text text-truncate" style="color: #711A4E">${product.description}</p>
                                            </div>
                                                <div class="mt-auto pb-3 pt-3 d-flex justify-content-around">
                                                    <a href="/product/${product.id}" class="btn btn-sm" >View
                                                        Details</a>
                                                    <a href="/cart/add/${product.id}" class="btn btn-sm" style="background-color: #d5449b;">Add to
                                                        Cart</a>
                                                </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>



<jsp:include page="../include/footer.jsp"/>