<%-- JSTL --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="../include/header.jsp"/>

<%--load external signup css --%>
<link href="/pub/css/cartView.css" rel="stylesheet">

<%--Header seaction--%>
<section class="body-bg pt-5 pb-5">
    <div class="container">
        <div class="row">
            <h1 class="m-0 text-center">Shopping Cart</h1>
        </div>
    </div>
</section>

<div class="data checkout-header">
    <div class="wt-display-flex-xs wt-align-items-center wt-justify-content-space-between">
        <p class="wt-text-title-larger">Your Cart</p>
    </div>
</div>

<div class="wt-position-relative">
    <div id="multi-shop-cart-list" class="wt-align-items-center">
        <div data-multi-shop-cart class="wt-mt-xs-1 wt-mt-lg-0 wt-mt-xs-5 wt-position-relative">
            <div class="wt-grid wt-position-relative wt-pl-xs-0 wt-pr-xs-0">
                <ul class="cart-list-items wt-grid__item-xs-12 wt-grid__item-sm-12 wt-p-xs-0 wt-pr-md-3 wt-height-full wt-list-unstyled wt-grid__item-lg-8 wt-grid__item-md-7">
                    <li class="condensed-desktop-cart wt-mt-xs-3 wt-mt-md-5">
                        <div class="wt-rounded-02 wt-b-xs">
                            <div class>
                                <div class="wt-pt-xs-4 wt-pl-xs-4 wt-pr-xs-4 wt-pb-xs-1">

                                </div>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>



<section class="bg-light2 pt-5 pb-5">
    <div class="container">
        <c:choose>
            <c:when test="${empty cartItems}">
                <p>Your cart is empty. <a href="/product/list">Continue shopping</a></p>
            </c:when>
            <c:otherwise>
                <table class="cart-table">
                    <thead>
                    <tr>
                        <th>Product</th>
                        <th>Quantity</th>
                        <th>Price</th>
                        <th>Subtotal</th>
                        <th>Actions</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="item" items="${cartItems}">
                        <tr>
                            <td>${item.product.name}</td>
                            <td>
                                <form action="/cart/update" method="post">
                                    <input type="hidden" name="productId" value="${item.product.id}">
                                    <input type="number" name="quantity" value="${item.quantity}" min="1" max="10">
                                    <button type="submit">Update</button>
                                </form>
                            </td>
                            <td>
                                <fmt:formatNumber value="${item.product.price}" type="currency" currencySymbol="$"/>
                            </td>
                            <td>
                                <fmt:formatNumber value="${item.product.price * item.quantity}" type="currency" currencySymbol="$"/>
                            </td>
                            <td>
                                <form action="/cart/remove" method="post">
                                    <input type="hidden" name="productId" value="${item.product.id}">
                                    <button type="submit">Remove</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <div class="cart-summary">
                    <p><strong>Total:</strong>
                        <fmt:formatNumber value="${totalPrice}" type="currency" currencySymbol="$"/>
                    </p>
                    <a href="/checkout" class="btn btn-primary">Proceed to Checkout</a>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</section>

<jsp:include page="../include/footer.jsp"/>
