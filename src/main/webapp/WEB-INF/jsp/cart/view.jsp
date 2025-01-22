<%-- JSTL --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="../include/header.jsp"/>

<%--load external signup css --%>
<link href="/pub/css/cartView.css" rel="stylesheet">


<%--Header seaction--%>
<section class="body-bg pt-3 pb-3">
    <div class="container-fluid">
        <div class="row d-flex">
            <h1 class="m-0 text-center">Shopping Cart</h1>
        </div>
    </div>
</section>

<section>
    <div class="container py-5">
    <c:choose>
        <c:when test="${empty cartItems}">
        <p style="font-size: x-large; padding-left: 200px">Your cart is empty. <a href="/products" style="color: #711A4E">Continue shopping</a></p>
        </c:when>
        <c:otherwise>
        <div class="row d-flex">
            <!-- Main Cart Section -->
            <div class="col-lg-8 col-md-7 mb-4" id="cart-section">
                <div class="card w-100 mb-4 card-sh">
                    <div class="card-header">
                        <h5 class="mb-0">Items in My Cart
                            <span>${counter.count}</span>
                        </h5>
                    </div>
                    <div class="card-body p-4">
                        <c:forEach var="item" items="${cartItems}" varStatus="counter">
                            <div class="row pt-2">
                                <div class="col-lg-3 col-md-12 mb-4 mb-lg-0">
                                    <!-- Image -->
                                    <div class="bg-image hover-overlay hover-zoom ripple rounded">
                                        <img src="${item.product.imageUrl}" class="w-100" alt="${item.product.name}"
                                             width="180px"
                                             height="150px"/>
                                        <a href="/product/${item.product.id}">
                                            <div class="mask" style="background-color: rgba(251, 251, 251, 0.2)"></div>
                                        </a>
                                    </div>
                                </div>
                                <div class="col-lg-5 col-md-6 mb-4 mb-lg-0">
                                    <p><strong>${item.product.name}</strong></p>
                                    <p>Category: ${item.product.category}</p>
                                    <div class="d-flex">
                                        <form action="/cart/remove/${item.product.id}" method="GET">
                                            <button type="submit" class="btn me-1 mb-2"
                                                    style="background-color: darkgrey; height: 38px;">
                                                <i class="fas fa-trash"></i>
                                            </button>
                                        </form>
                                        <button class="btn mb-2" style="background-color: #d5449b; height: 38px;">
                                            <i class="fas fa-heart"></i>
                                        </button>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6 mb-4 mb-lg-0">
                                    <div class="d-flex mb-4 justify-content-center">
                                        <form action="/cart/adjustQuantity" method="POST" style="margin: 0;">
                                            <input type="hidden" name="productId" value="${item.product.id}">
                                            <input type="hidden" name="adjustment" value="-1">
                                            <button type="submit" class="btn btn-secondary px-3 me-2"
                                                    onclick="this.parentNode.querySelector('input[type=number]').stepDown()"
                                                    style="background-color: #961362; height: 40px; width: 40px;">
                                                <i class="fas fa-minus"></i>
                                            </button>
                                        </form>
                                        <div class="form-outline">
                                            <input id="form1" name="quantity" value="${item.quantity}" type="number"
                                                   class="form-control text-center"
                                                   style="width: 60px; height: 40px; background-color: white; padding-left: 22px"
                                                   readonly/>
                                        </div>
                                        <form action="/cart/adjustQuantity" method="POST" style="margin: 0;">
                                            <input type="hidden" name="productId" value="${item.product.id}">
                                            <input type="hidden" name="adjustment" value="1">
                                            <button type="submit" class="btn btn-secondary px-3 ms-2"
                                                    onclick="this.parentNode.querySelector('input[type=number]').stepUp()"
                                                    style="background-color: #961362; height: 40px; width: 40px;">
                                                <i class="fas fa-plus"></i>
                                            </button>
                                        </form>
                                    </div>
                                    <p class="text-start text-md-center">
                                        <strong><fmt:formatNumber value="${item.product.price}" type="currency"
                                                                  currencySymbol="$"/></strong>
                                    </p>
                                </div>
                            </div>
                            <hr class="my-4"/>
                        </c:forEach>
                    </div>
                </div>
            </div>

            <!-- Summary Section -->
            <div class="col-lg-4 col-md-5">
                <div class="card w-100 mb-4 card-sh" style="color: white; background-color: #711A4E; border-radius: 10px">
                    <div class="card-header py-3">
                        <h5 class="mb-0">Summary</h5>
                    </div>
                    <div class="card-body">
                        <ul class="list-group list-group-flush">
                            <li
                                    class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 pb-0" style="background-color: #711A4E; color: white">
                                Subtotal
                                <span><p class="mb-2"> <fmt:formatNumber value="${totalPrice}" type="currency"
                                                                         currencySymbol="$"/> </p> </span>
                            </li>
                            <li class="list-group-item d-flex justify-content-between align-items-center px-0" style="background-color: #711A4E; color: white;">
                                Taxes
                                <span><p class="mb-2"> <fmt:formatNumber value="${totalPrice * 0.10}" type="currency"
                                                                         currencySymbol="$"/></p></span>
                            </li>
                            <li
                                    class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 mb-3" style="background-color: #711A4E; color: white">
                                <div>
                                    <strong>Total amount</strong>
                                    <strong>
                                        <p class="mb-0"><p class="mb-2"><fmt:formatNumber value="${totalPrice * 0.10 + totalPrice}" type="currency"
                                                                                          currencySymbol="$"/></p>
                                    </strong>
                                </div>
                                <span><strong>$53.98</strong></span>
                            </li>
                        </ul>
                        <a href="/cart/confirmation" class="btn" style="background-color: #d5449b">Proceed to Checkout</a>
                    </div>
                </div>
            </div>
        </div>
        </c:otherwise>
    </c:choose>
    </div>
</section>

<jsp:include page="../include/footer.jsp"/>
