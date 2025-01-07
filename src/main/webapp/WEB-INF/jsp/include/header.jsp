<%-- JSTL --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- for security --%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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

</head>
<body class="bg-light2">

<%-- Work on Header from bootstrap--%>
<section>
    <nav class="navbar navbar-expand-lg navbar-dark bg-header">
        <div class="container-fluid">
            <a class="navbar-brand" href="/homepage"><img src="./pub/images/craftsylogo.png" alt="Craftsy" height="100px" ></a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="/index">Home</a>
                    </li>
                    <li class="nav-item">
                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                                       data-bs-toggle="dropdown" aria-expanded="false" style="color: beige;">
                                        Categories
                                    </a>
                                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        <li><a class="dropdown-item" href="#" style="font-weight: bold">Art and Decor</a></li>
                                        <li><a class="dropdown-item" href="#">Paintings</a></li>
                                        <li><a class="dropdown-item" href="#">Wall Hangings</a></li>
                                        <li><a class="dropdown-item" href="#">Sculptures</a></li>
                                        <li><a class="dropdown-item" href="#">Home Accents</a></li>
                                        <li>
                                            <hr class="dropdown-divider">
                                        </li>
                                        <li><a class="dropdown-item" href="#" style="font-weight: bold">Jewelry and Accessories</a></li>
                                        <li><a class="dropdown-item" href="#">Handmade Jewelry</a></li>
                                        <li><a class="dropdown-item" href="#">Ethnic Jewelry</a></li>
                                        <li><a class="dropdown-item" href="#">Jewelry and Accessories</a></li>
                                        <li>
                                            <hr class="dropdown-divider">
                                        </li>
                                        <li><a class="dropdown-item" href="#" style="font-weight: bold">Handicrafts and Folk Art</a></li>
                                        <li><a class="dropdown-item" href="#">Cultural Handicrafts</a></li>
                                        <li><a class="dropdown-item" href="#">Pottery</a></li>
                                        <li><a class="dropdown-item" href="#">Bamboo work</a></li>
                                    </ul>
                                </li>
                            </ul>

                        </div>
                        
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/customer/search">Product Search Bar</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/customer/create">Categories</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/employee/search">Login</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/customer/create">Cart</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</section>