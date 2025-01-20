<%-- JSTL --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="../include/header.jsp"/>

<%--load external signup css --%>
<link href="/pub/css/cartView.css" rel="stylesheet">

<%--Header seaction--%>
<section class="body-bg pt-3 pb-3">
    <div class="container">
        <div class="row">
            <h1 class="m-0 text-center">Shopping Cart</h1>
        </div>
    </div>
</section>

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
                            <!-- Product Image -->

                            <td>
                                <div class="quantity-controls" style="display: inline">
                                    <form action="/cart/adjustQuantity" method="POST" style="display:inline;">
                                        <input type="hidden" name="productId" value="${item.product.id}">
                                        <input type="hidden" name="adjustment" value="-1">
                                        <button type="submit" class="quantity-button">-</button>
                                    </form>
                                    <span class="quantity-display"> ${item.quantity}</span>
                                    <form action="/cart/adjustQuantity" method="POST" style="display:inline;">
                                        <input type="hidden" name="productId" value="${item.product.id}">
                                        <input type="hidden" name="adjustment" value="1">
                                        <button type="submit" class="quantity-button">+</button>
                                    </form>
                                </div>
                            </td>
                            <td>
                                <fmt:formatNumber value="${item.product.price}" type="currency" currencySymbol="$"/>
                            </td>
                            <td>
                                <fmt:formatNumber value="${item.product.price * item.quantity}" type="currency"
                                                  currencySymbol="$"/>
                            </td>
                            <td>
                                <form action="/cart/remove/${item.product.id}" method="GET">
                                    <input type="hidden" name="productId" value="${item.product.id}">
                                    <button type="submit" class="delete-button">Delete</button>
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
                    <a href="/cart/confirmation" class="btn btn-primary">Proceed to Checkout</a>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</section>

<jsp:include page="../include/footer.jsp"/>
