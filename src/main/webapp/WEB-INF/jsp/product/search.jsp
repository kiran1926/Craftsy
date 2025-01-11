<%-- JSTL --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="../include/header.jsp"/>


<section class="body-bg pt-5 pb-5">
    <div class="container">
        <div class="row">
            <h1 class="m-0 text-center">Products Found</h1>
            <p class="m-0 text-center">Product</p>
        </div>
    </div>
</section>

<%--<section class="body-bg pt-5 pb-5" >--%>
<%--    <div class="container">--%>
<%--        <form action="/product/search" class="mb-0">--%>
<%--            <div class="row pt-3 justify-content-center">--%>
<%--                <div class="col-6">--%>

<%--                    <div class="mb-3">--%>
<%--                        <label for="firstName" class="form-label">First Name</label>--%>
<%--                        <input type="text" class="form-control" id="firstName" name="firstName" value="${search}">--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="row justify-content-center">--%>
<%--                <div class="col-6">--%>
<%--                    <button type="submit" class="btn btn-primary">Search</button>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </form>--%>
<%--    </div>--%>
<%--</section>--%>

<%--  <c:if test="${customersKey.size() > 0}"> --%>
<c:if test="${ not empty search}">
    <section class="body-bg pb-4 pt-4">
        <div class="container">
            <h2 class="text-center">Products Found(${productsFound.size()})</h2>
            <table class="table mt-5">
                <tr>
                    <th>Name</th>
                    <th>Id</th>
                    <th>Description</th>
                    <th>Price</th>
                    <th>Image</th>
                    <th>In stock</th>
                    <th>Edit</th>
                </tr>

                <c:forEach var="product" items="${productsFound}">
                    <tr>
                        <td>${product.name}</td>
                        <td>${product.description}</td>
                        <td>${product.price}</td>
                        <td>${product.stockQuantity}</td>
                        <td><img src="${product.imageUrl}" style="width:200px;"/></td>
                        <td><a href="/product/edit/${product.id}">Edit</a></td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </section>
</c:if>

<jsp:include page="../include/footer.jsp"/>
