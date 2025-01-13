<%-- JSTL --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="../include/header.jsp"/>


<%--Header seaction--%>
<section class="body-bg pt-5 pb-5">
    <div class="container">
        <div class="row">
            <h1 class="m-0 text-center">Products Found</h1>
            <p class="m-0 text-center">Product</p>
        </div>
    </div>
</section>

<%--trying to create a grid of products search need to fix code--%>

<div class="container mt-4">
    <!-- Filters -->
    <div class="d-flex flex-wrap gap-2 mb-3">
        <button class="btn btn-outline-secondary">Category</button>
        <button class="btn btn-outline-secondary">Price Range</button>
        <button class="btn btn-outline-secondary">Rating</button>
        <button class="btn btn-outline-secondary">Sort by</button>
    </div>

    <!-- Products Grid -->
    <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-4 g-4">
        <c:forEach var="product" items="${productsFound}">
            <div class="col">
                <div class="card h-100">
                    <img src="${product.imageUrl}" class="card-img-top" alt="${product.name}">
                    <div class="card-body d-flex flex-column">
                        <h5 class="card-title">${product.name}</h5>
                        <p class="card-text">$${product.price}</p>
                        <p class="card-text text-truncate">${product.description}</p>
                        <div class="mt-auto">
                            <a href="/product/${product.id}" class="btn btn-primary btn-sm">View Details</a>
                            <a href="/cart/add/${product.id}" class="btn btn-success btn-sm">Add to Cart</a>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>

    <!-- Pagination -->
    <nav aria-label="Page navigation" class="mt-4">
        <ul class="pagination justify-content-center">
            <li class="page-item ${page == 1 ? 'disabled' : ''}">
                <a class="page-link" href="?page=${page - 1}" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                </a>
            </li>
            <c:forEach var="i" begin="1" end="${totalPages}">
                <li class="page-item ${page == i ? 'active' : ''}">
                    <a class="page-link" href="?page=${i}">${i}</a>
                </li>
            </c:forEach>
            <li class="page-item ${page == totalPages ? 'disabled' : ''}">
                <a class="page-link" href="?page=${page + 1}" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                </a>
            </li>
        </ul>
    </nav>
</div>


<jsp:include page="../include/footer.jsp"/>
