<%-- JSTL --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="../include/header.jsp"/>

<%--load external signup css --%>
<link href="/pub/css/checkout.css" rel="stylesheet">


<section class="body-bg pt-3 pb-3">
    <div class="container">
        <div class="row">
            <h1 class="m-0 text-center">Checkout</h1>
        </div>
    </div>
</section>

<section>
    <div class="container py-5">
        <div class="row d-flex justify-content-center">

            <!-- Left Block: Shipping Details -->
            <div class="col-md-6 ">
                <div class="card shadow-sm" style="border-radius: 10px">
                    <div class="card-header text-center bg-footer text-white p-4" style="border-top-left-radius: 10px; border-top-right-radius:10px">
                        <h3 class="mb-0">Shipping Details</h3>
                    </div>
                    <div class="card-body p-4">
                        <form action="/cart/checkout" method="POST">
                            <!-- Full Name -->
                            <div class="mb-3">
                                <label for="name" class="form-label">Full Name:</label>
                                <input type="text" id="name" name="name" class="form-control" placeholder="Enter your full name" required />
                            </div>

                            <!-- Shipping Address -->
                            <div class="mb-3">
                                <label for="address1" class="form-label">Shipping Address:</label>
                                <input type="text" id="address1" name="address" class="form-control" placeholder="Enter your shipping address" required />
                            </div>

                            <!-- Phone -->
                            <div class="mb-3">
                                <label for="phone" class="form-label">Phone:</label>
                                <input type="text" id="phone" name="phone" class="form-control" placeholder="Enter your phone number" required />
                            </div>

                            <!-- Payment Method -->
                            <div class="mb-4">
                                <label for="paymentMethod" class="form-label">Payment Method:</label>
                                <select id="paymentMethod" name="paymentMethod" class="form-select" required>
                                    <option value="" disabled selected>Select a payment method</option>
                                    <option value="creditCard">Credit Card</option>
                                    <option value="debitCard">Debit Card</option>
                                    <option value="applePay">Apple Pay</option>
                                    <option value="paypal">PayPal</option>
                                </select>
                            </div>

<%--                            <!-- Confirm Button -->--%>
<%--                            <div class="d-grid">--%>
<%--                                <button type="submit" class="btn btn-primary btn-block">Confirm Details</button>--%>
<%--                            </div>--%>
                        </form>
                    </div>
                </div>
            </div>


            <!-- Order Summary and Payment Section -->
            <div class="col-md-6">
                <!-- Order Summary -->
                <div class="card shadow-sm mb-4" style="border-radius: 10px">
                    <div class="card-header text-center bg-footer text-white" style="border-top-left-radius: 10px; border-top-right-radius:10px">
                        <h3 class="mb-0">Order Summary</h3>
                    </div>
                    <div class="card-body p-4">
                        <ul class="list-group mb-3">
                            <!-- Example of dynamically generated items -->
                            <c:forEach var="item" items="${cartItems}">
                                <li class="list-group-item d-flex justify-content-between align-items-center">
                                    <div>
                                        <h6 class="my-0">${item.product.name}</h6>
                                        <small class="text-muted">Quantity: ${item.quantity}</small>
                                    </div>
                                    <span class="text-muted">$<fmt:formatNumber value="${item.product.price * item.quantity}"/></span>
                                </li>
                            </c:forEach>
                        </ul>

                        <!-- Subtotal -->
                        <div class="d-flex justify-content-between">
                            <strong>Subtotal:</strong>
                            <span>$<fmt:formatNumber value="${subtotal}"/></span>
                        </div>

                        <!-- Taxes -->
                        <div class="d-flex justify-content-between">
                            <strong>Taxes (10%):</strong>
                            <span>$<fmt:formatNumber value="${subtotal * 0.10}"/></span>
                        </div>

                        <!-- Total -->
                        <hr>
                        <div class="d-flex justify-content-between">
                            <strong>Total (Incl. Taxes):</strong>
                            <span>$<fmt:formatNumber value="${subtotal + (subtotal * 0.10)}"/></span>
                        </div>
                    </div>
                </div>

                <!-- Payment Section -->
                <div class="card bg-footer text-white rounded-3 card-sh">
                    <div class="card-body" style="border-radius: 10px">
                        <div class="d-flex justify-content-between align-items-center mb-4">
                            <h5 class="mb-0">Card Details</h5>
                        </div>
                        <p class="small mb-2">Card Type</p>
                        <a href="#" class="text-white"><i class="fab fa-cc-mastercard fa-2x me-2"></i></a>
                        <a href="#" class="text-white"><i class="fab fa-cc-visa fa-2x me-2"></i></a>
                        <a href="#" class="text-white"><i class="fab fa-cc-amex fa-2x me-2"></i></a>
                        <a href="#" class="text-white"><i class="fab fa-cc-paypal fa-2x"></i></a>
                        <form class="mt-4">
                            <div class="form-outline form-white mb-4">
                                <input type="text" id="typeName" class="form-control form-control-md"
                                       placeholder="Cardholder's Name" />
                                <label class="form-label" for="typeName">Cardholder's Name</label>
                            </div>
                            <div class="form-outline form-white mb-4">
                                <input type="text" id="typeText" class="form-control form-control-md"
                                       placeholder="1234 5678 9012 3457" minlength="19" maxlength="19" />
                                <label class="form-label" for="typeText">Card Number</label>
                            </div>
                            <div class="row mb-4">
                                <div class="col-md-6">
                                    <div class="form-outline form-white">
                                        <input type="text" id="typeExp" class="form-control form-control-md"
                                               placeholder="MM/YYYY" minlength="7" maxlength="7" />
                                        <label class="form-label" for="typeExp">Expiration</label>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-outline form-white">
                                        <input type="password" id="cvv" class="form-control form-control-md"
                                               placeholder="&#9679;&#9679;&#9679;" minlength="3" maxlength="3" />
                                        <label class="form-label" for="cvv">Cvv</label>
                                    </div>
                                </div>
                            </div>
                        </form>
                        <hr class="my-4" />
                        <a href="/cart/confirmation" class="btn btn-lg" style="background-color: #d5449b; margin-left: 150px; width: 300px">Pay
                            <fmt:formatNumber value="${subtotal * 0.10 + subtotal}" type="currency"
                                              currencySymbol="$" /></a>
                    </div>
                </div>
            </div>

        </div>
    </div>
</section>
<jsp:include page="../include/footer.jsp"/>
