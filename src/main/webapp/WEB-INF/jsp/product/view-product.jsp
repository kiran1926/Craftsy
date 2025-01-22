<%-- JSTL --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<jsp:include page="../include/header.jsp"/>
<%--load external signup css --%>
<link href="/pub/css/view-product.css" rel="stylesheet">

<section>
    <div class="container card-sh pt-4 pb-4" style="margin-top: 100px; margin-bottom: 100px; background-color: white">
        <div class="col-md-12 p-5">
            <div class="row">
                <div class="col-md-6 text-center">
                    <img alt="" src="${product.imageUrl}" width="360px" height="440px" style="border-radius: 10px">
                </div>
                <div class="col-md-6">
                    <p class="fs-1">${product.name}
                        <sec:authorize access="hasAnyAuthority('ARTISAN', 'ADMIN')">
                                <a href="/product/edit/${product.id}">
                                    <i class="fa-solid fa-pen-to-square" style="color: #711A4E; padding-left: 40px; font-size: 35px"></i>
                                </a>
                            </sec:authorize>
                    </p><hr>
                    <br>
                    <p>
                        <span class="fs-4 fw-bold" style="color: #711A4E">Product Details: </span>
                        <br><span class="fw-bold"> Category : </span> ${product.category}
                        <br> <span class="fw-bold">About this item :  </span> ${product.description}
                        <br>
                        <c:if var="quantity" test="${product.stockQuantity > 0}">
                            <span class="fs-4" style="color: #218838">In Stock</span>
                        </c:if>
                        <c:if var="quantity" test="${product.stockQuantity <= 0}">
                            <span class="fs-4" style="color: #dc3545">Out Of Stock</span>
                        </c:if>
                        <br> <span class="fw-bold"> Policy : </span> Free 30-day returns
                    </p>
                    <p class="fs-5 fw-bold">
                        Price : $ ${product.price}
                    </p>
                    <div class="row">
                        <div class="col-md-4 text-center p-2">
                            <i class="fa-solid fa-paintbrush fa-2x"></i>
                            <p>Customization Available</p>
                        </div>
                        <div class="col-md-4 text-center p-2">
                            <i class="fas fa-undo-alt fa-2x"></i>
                            <p>Return Available</p>
                        </div>
                        <div class="col-md-4 text-center p-2">
                            <i class="fas fa-truck-moving fa-2x"></i>
                            <p>Free Shipping</p>
                        </div>
                    </div>
                    <c:if test="${product.stockQuantity > 0}">
                        <a href="/cart/add/${product.id}" class="btn col-md-12">Add To Cart</a>
                    </c:if>
                    <c:if test="${product.stockQuantity <= 0}">
                        <a href="/cart/add/${product.id}" class="btn col-md-12 disabled">Out Of Stock</a>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
</section>

<jsp:include page="../include/footer.jsp"/>
