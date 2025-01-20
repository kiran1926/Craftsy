<%-- JSTL --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="../include/header.jsp"/>

<%--load external signup css --%>
<link href="/pub/css/checkout.css" rel="stylesheet">

<section>
    <div class="checkout-container">
    <h1>Checkout</h1>

    <!-- Cart Summary Section -->
    <div class="cart-summary">
        <h2>Order Summary</h2>
        <table class="cart-items-table">
            <thead>
            <tr>
                <th>Product</th>
                <th>Quantity</th>
                <th>Price</th>
                <th>Subtotal</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="item" items="${cartItems}">
                <tr>
                    <td>${item.product.name}</td>
                    <td>${item.quantity}</td>
                    <td>$${item.product.price}</td>
                    <td>$${item.product.price * item.quantity}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <div class="total-price">
            <span>Total: $${totalPrice}</span>
        </div>
    </div>

    <!-- Shipping Details Section -->
    <div class="shipping-details">
        <h2>Shipping Details</h2>
        <form action="/cart/checkout" method="POST">
            <label for="address">Shipping Address:</label>
            <input type="text" id="address" name="address" required></input>

            <label for="paymentMethod">Payment Method:</label>
            <select id="paymentMethod" name="paymentMethod" required>
                <option value="creditCard">Credit Card</option>
                <option value="debitCard">Debit Card</option>
                <option value="paypal">PayPal</option>
            </select>

            <button type="submit" class="confirm-button">Confirm Order</button>
        </form>
    </div>

    <!-- Error/Message Section -->
    <div class="messages">
        <c:if test="${not empty error}">
            <p class="error-message">${error}</p>
        </c:if>
        <c:if test="${not empty message}">
            <p class="success-message">${message}</p>
        </c:if>
    </div>
    </div>
</section>

<jsp:include page="../include/footer.jsp"/>
