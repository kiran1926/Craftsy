<%-- JSTL --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="../include/header.jsp"/>
<%--load external signup css --%>
<link href="/pub/css/products.css" rel="stylesheet">

<section>
    <div class="container mt-5 p-5">
        <div class="card card-sh">
            <div class="card-header text-center pb-1" style="color: #711A4E;">
                <p class="fs-2">View Products</p>
                <div class="messages">
                    <c:if test="${not empty error}">
                        <p class="error-message">${error}</p>
                    </c:if>
                    <c:if test="${not empty message}">
                        <p class="success-message">${message}</p>
                    </c:if>
                </div>
            </div>
            <div class="card-body">
                <table class="table">
                    <thead>
                    <tr>
                        <th scope="col">Sr.No</th>
                        <th scope="col">Name</th>
                        <th scope="col">Image</th>
                        <th scope="col">Category</th>
                        <th scope="col">Price</th>
                        <th scope="col">Quantity in Stock</th>
                        <th scope="col">Action</th>
                    </tr>
                    </thead>
                    <tbody>

                    <c:forEach var="product" items="${products}" varStatus="counter">
                        <tr>
                            <th scope="row">${counter.count}</th>
                            <td>${product.name}</td>
                            <td><img alt="${product.name}" src="${product.imageUrl}" height="50px" width="50px"></td>
                            <td>${product.category}</td>
                            <td>$${product.price}</td>
                            <td style="padding-left: 20px ">${product.stockQuantity}</td>
                            <td><a href="/product/edit/${product.id}"><i class="fa-solid fa-pen-to-square"
                                               style="color: #711A4E; padding-right: 10px; font-size: larger"></i></a>
                                <a href="/admin/deleteProduct/${product.id}"><i class="fa-solid fa-trash" style="color: #711A4E; font-size: larger"></i></a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</section>


<jsp:include page="../include/footer.jsp"/>