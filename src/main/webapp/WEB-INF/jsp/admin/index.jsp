<%-- JSTL --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="../include/header.jsp"/>
<%--load external signup css --%>

<section>
    <div class="container p-5">
        <p class="text-center fs-1 pb-2 mt-4">Admin Dashboard</p>
        <div class="row p-5 d-flex justify-content-space-between">
            <div class="col-md-4 p-2">
                <a href="/product/create" class="text-decoration" style="color: #711A4E">
                    <div class="card card-sh">
                        <div class="card-body text-center">
                            <i class="fa-solid fa-plus fa-2x"></i>
                            <p class="fs-5 pt-2"> Add Product</p>
                        </div>
                    </div>
                </a>
            </div>

            <div class="col-md-4 p-2">
                <a href="/admin/category" class="text-decoration" style="color: #711A4E">
                    <div class="card card-sh">
                        <div class="card-body text-center">
                            <i class="fa-solid fa-list fa-2x"></i>
                            <p class="fs-5 pt-2"> Add Category</p>
                        </div>
                    </div>
                </a>
            </div>

            <div class="col-md-4 p-2">
                <a href="/admin/products" class="text-decoration" style="color: #711A4E">
                    <div class="card card-sh">
                        <div class="card-body text-center">
                            <i class="fa-solid fa-table-list fa-2x"></i>
                            <p class="fs-5 pt-2"> View Product</p>
                        </div>
                    </div>
                </a>
            </div>

            <div class="col-md-4 mt-4 p-2">
                <a href="/product/create" class="text-decoration" style="color: #711A4E">
                    <div class="card card-sh">
                        <div class="card-body text-center">
                            <i class="fa-solid fa-box-open fa-2x"></i>
                            <p class="fs-5 pt-2"> Orders</p>
                        </div>
                    </div>
                </a>
            </div>

            <div class="col-md-4 mt-4 p-2">
                <a href="/product/create" class="text-decoration" style="color: #711A4E">
                    <div class="card card-sh">
                        <div class="card-body text-center">
                            <i class="fa-solid fa-circle-user fa-2x"></i>
                            <p class="fs-5 pt-2"> Users</p>
                        </div>
                    </div>
                </a>
            </div>

            <div class="col-md-4 mt-4 p-2">
                <a href="/product/create" class="text-decoration" style="color: #711A4E">
                    <div class="card card-sh">
                        <div class="card-body text-center">
                            <i class="fa-solid fa-user-plus fa-2x"></i>
                            <p class="fs-5 pt-2"> Add Admin</p>
                        </div>
                    </div>
                </a>
            </div>
        </div>
    </div>
</section>


<jsp:include page="../include/footer.jsp"/>
