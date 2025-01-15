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
        <div class="container-fluid">
            <a class="navbar-brand" href="/homepage" style="padding-left: 140px"><img src="/pub/images/logo.png"
                                                                                      alt="Craftsy" height="100px"></a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                    aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="/homepage"
                           style="padding-right: 30px; color: whitesmoke">Home</a>
                    </li>
                    <li class="nav-item">
                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href=/product/search" id="navbarDropdown"
                                       role="button"
                                       data-bs-toggle="dropdown" aria-expanded="false"
                                       style="color: whitesmoke; padding-right: 30px">
                                        Categories
                                    </a>
                                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        <li><a class="dropdown-item" href="#" style="font-weight: bold">Art and
                                            Decor</a></li>
                                        <li><a class="dropdown-item" href="#">Paintings</a></li>
                                        <li><a class="dropdown-item" href="#">Wall Hangings</a></li>
                                        <li><a class="dropdown-item" href="#">Sculptures</a></li>
                                        <li><a class="dropdown-item" href="#">Home Accents</a></li>
                                        <li>
                                            <hr class="dropdown-divider">
                                        </li>
                                        <li><a class="dropdown-item" href="#" style="font-weight: bold">Jewelry and
                                            Accessories</a></li>
                                        <li><a class="dropdown-item" href="#">Handmade Jewelry</a></li>
                                        <li><a class="dropdown-item" href="#">Ethnic Jewelry</a></li>
                                        <li><a class="dropdown-item" href="#">Jewelry and Accessories</a></li>
                                        <li>
                                            <hr class="dropdown-divider">
                                        </li>
                                        <li><a class="dropdown-item" href="#" style="font-weight: bold">Handicrafts and
                                            Folk Art</a></li>
                                        <li><a class="dropdown-item" href="#">Cultural Handicrafts</a></li>
                                        <li><a class="dropdown-item" href="#">Pottery</a></li>
                                        <li><a class="dropdown-item" href="#">Bamboo work</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </li>

                    <li class="nav-item">
                        <div class="container">
                            <form action="/product/search" class="d-flex">
                                <div class="input-group" style="width:990px; padding-right: 30px">
                                    <input class="form-control" type="search" id="name" name="name" value="${search}"
                                           placeholder="Search Craftsy"
                                           aria-label="Search" style="font-size: larger">
                                    <button class="btn btn-outline" style="background-color: #ede0e0; width:70px; "
                                            type="submit">
                                        <a class="nav-link" href="/product/search">
                                            <ion-icon name="search-outline"
                                                      style="color: #973b72; font-size: larger;  "></ion-icon>
                                        </a>
                                    </button>
                                </div>
                            </form>
                        </div>
                    </li>

                    <%--  to create product for Artisan  --%>
                    <sec:authorize access="hasAuthority('ARTISAN')">
                        <li class="nav-item">
                            <a class="nav-link" href="/product/create" style="padding-right: 20px; color: whitesmoke">Create
                                Product</a>
                        </li>
                    </sec:authorize>


                    <sec:authorize access="!isAuthenticated()">
                        <li class="nav-item">
                            <a class="nav-link" href="/login/login" style="padding-right: 30px; color: whitesmoke">Log
                                In</a>
                        </li>
                    </sec:authorize>

                    <sec:authorize access="isAuthenticated()">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href=/user/myProfile" id="profileDropdown" role="button"
                               data-bs-toggle="dropdown" aria-expanded="false"
                               style="color: whitesmoke; padding-right: 10px">
                                <ion-icon name="person-outline"></ion-icon>
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li>
                                    <a class="dropdown-item" href="#">
                                        <sec:authentication property="principal.username"/>
                                    </a>
                                </li>
                                <li><a class="dropdown-item" href="#">My Orders</a></li>
                                <li><a class="dropdown-item" href="#">My Wishlist</a></li>
                                <li><a class="dropdown-item" href="#">Account</a></li>
                            </ul>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/login/logout" style="padding-right: 10px; color: whitesmoke">Logout</a>
                        </li>
                    </sec:authorize>
                    <li class="nav-item">
                        <a class="nav-link" href="/cart/view">
                            <ion-icon name="cart-sharp" style="font-size:25px; color: whitesmoke"></ion-icon>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</section>