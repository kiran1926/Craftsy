<%-- JSTL --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- for security --%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- ==================== icons import ======================= -->
<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>

</html>

<html>
<head>
    <title>Title</title>

    <!--  bootstrap  -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"></script>
    <!-- global css -->
    <link href="/pub/css/global.css" rel="stylesheet">
    <!-- jquery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

    <!--Font import-->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link
            href="https://fonts.googleapis.com/css2?family=Londrina+Shadow&family=Quicksand:wght@300..700&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap"
            rel="stylesheet">

    <%-- fontawesome    --%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">




</head>

<body class="bg-light2">

<style>
    .container-fluid {
        font-family: "Quicksand", sans-serif;
        font-size: medium;
        font-weight: 500;
    }
</style>

<%-- Work on Header from bootstrap--%>
<section>
    <nav class="navbar navbar-expand-lg navbar-dark bg-header">
        <div class="container-fluid pt-2 pb-2">
            <!-- Brand Logo -->
            <a class="navbar-brand" href="/homepage" style="padding-left: 105px;">
                <img src="/pub/images/logo.png" alt="Craftsy" height="90px">
            </a>

            <!-- Toggler Button -->
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                    aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <!-- Navbar Links -->
            <div class="collapse navbar-collapse" id="navbarNav">
                <!-- Right-aligned Items -->
                <ul class="navbar-nav me-auto">
                    <!-- Home Link -->
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="/homepage"
                           style="padding-right: 30px; color: whitesmoke; font-size: 20px;">Home</a>
                    </li>

                    <!-- Categories Dropdown -->
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="/product/search" id="navbarDropdown" role="button"
                           data-bs-toggle="dropdown" aria-expanded="false"
                           style="color: whitesmoke; padding-right: 30px; font-size: 20px;">
                            Categories
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="/products/category?category=Art%20and%20Decor" style="font-weight: bold;">Art and Decor</a></li>
                            <li><a class="dropdown-item" href="/products/category?category=Paintings">Paintings</a></li>
                            <li><a class="dropdown-item" href="/products/category?category=Wall%20Hangings">Wall Hangings</a></li>
                            <li><a class="dropdown-item" href="/products/category?category=Sculptures">Sculptures</a></li>
                            <li><hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item" href="#" style="font-weight: bold;">Handicrafts and Folk Art</a></li>
                            <li><a class="dropdown-item" href="/products/category?category=Cultural%20Handicrafts">Cultural Handicrafts</a></li>
                            <li><a class="dropdown-item" href="/products/category?category=Pottery">Pottery</a></li>
                            <li><a class="dropdown-item" href="/products/category?category=Bamboo%20Artifacts">Bamboo Artifacts</a></li>
                        </ul>
                    </li>


                <!-- Center-aligned Search Bar -->
                    <!-- Search Bar -->
                    <li class="nav-item">
                        <form action="/product/search" class="d-flex flex-grow-1 mx-3"  style="width:100%; max-width: 1000px;">
                            <div class="input-group" style="max-width: 300px; padding-right: 30px;">
                                <input class="form-control" type="search" id="name" name="name" value="${search}"
                                       placeholder="Search Craftsy" aria-label="Search" style="font-size: larger;">
                                <button class="btn btn-outline" style="background-color: #ede0e0; width: 70px;" type="submit">
                                    <ion-icon name="search-outline" style="color: #973b72; font-size: larger;"></ion-icon>
                                </button>
                            </div>
                        </form>
                    </li>
                </ul>

                <!-- Right-aligned Items -->
                <ul class="navbar-nav ms-auto">
                    <!-- Create Product -->
                    <sec:authorize access="hasAnyAuthority('ARTISAN', 'ADMIN')">
                        <li class="nav-item me-3">
                            <a class="nav-link" href="/product/create"
                               style="padding-right: 30px; color: whitesmoke; font-size: 20px;">Create Product</a>
                        </li>
                    </sec:authorize>

                    <!-- Login/Logout/Profile -->
                    <sec:authorize access="!isAuthenticated()">
                        <li class="nav-item me-3">
                            <a class="nav-link" href="/login/login"
                               style="padding-right: 30px; color: whitesmoke; font-size: 20px;">Log In</a>
                        </li>
                    </sec:authorize>
                    <sec:authorize access="isAuthenticated()">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="/user/myProfile" id="profileDropdown" role="button"
                               data-bs-toggle="dropdown" aria-expanded="false"
                               style="color: whitesmoke; padding-right: 30px;">
                                <i class="fa-solid fa-user" style="font-size: 25px;"></i>
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="profileDropdown">
                                <li><a class="dropdown-item" href="#"><sec:authentication property="principal.username" /></a></li>
                                <sec:authorize access="hasAuthority('ADMIN')">
                                    <li><a class="dropdown-item" href="/admin/">Admin</a></li>
                                </sec:authorize>
                                <li><a class="dropdown-item" href="#">My Orders</a></li>
                                <li><a class="dropdown-item" href="#">My Wishlist</a></li>
                                <li><a class="dropdown-item" href="#">Account</a></li>
                                <li><a class="dropdown-item" href="/login/logout">Logout</a></li>
                            </ul>
                        </li>
                    </sec:authorize>

                    <!-- Cart -->
                    <li class="nav-item">
                        <a class="nav-link" href="/cart/view">
                            <i class="fa-solid fa-cart-shopping" style="font-size: 25px; color: white;"></i>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</section>
