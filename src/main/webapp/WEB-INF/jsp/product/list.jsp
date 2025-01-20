<%-- JSTL --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="../include/header.jsp"/>
<%--load external signup css --%>
<link href="/pub/css/list.css" rel="stylesheet">

<section>
    <div class="container-fluid mt-0">
        <div class="row">
            <div class="col-md-2 p-0">
                <div class="card shadow-sm pb-0 mb-5 bg-body-tertiary rounded body-bg" style="border-radius: 10px;">
                    <div class="card-body">
                        <div class="list-group" style="border-radius: 10px;">
                            <a href="#" class="list-group-item list-group-item-action active" style="background-color: #711A4E" aria-current="true">
                                Categories </a>
                            <a href="#" class="list-group-item list-group-item-action" style="color: #711A4E">Pottery</a>
                            <a href="#" class="list-group-item list-group-item-action" style="color: #711A4E">Bamboo Artifacts</a>
                            <a href="#" class="list-group-item list-group-item-action" style="color: #711A4E">Paintings</a>
                            <a href="#" class="list-group-item list-group-item-action" style="color: #711A4E">Sculptures</a>
                            <a href="#" class="list-group-item list-group-item-action" style="color: #711A4E">Wall Hangings</a>
                            <a href="#" class="list-group-item list-group-item-action" style="color: #711A4E">Cultural Handicrafts</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-10">
                <div class="card shadow-sm p-3 mb-5 bg-body-tertiary rounded body-bg">
                    <div class="card-body">
                        <p class="fs-3 text-center" style="color: #711A4E; font-size:200px; font-weight: bolder">Products</p>
                        <%------------     Product grid      ------------%>

                        <div class="row">
                            <c:forEach var="product" items="${products}">
                                <div class="col-md-3 mt-5 d-flex justify-content-center">
                                    <div class="card">
                                        <div class="card-body text-center pt-3">
                                            <img alt="" src="${product.imageUrl}" width="100%" height="400px"
                                                 style="border-radius: 10px; ">
                                            <p class="fs-5 text-center pt-2 fw-bold ">${product.name}</p>
                                            <div class="row text-center">
                                                <p class="fs-4" >$ ${product.price}</p>
                                                <p class="fs-2card-text text-truncate" style="color: #711A4E">${product.description}</p>
                                            </div>
                                                <div class="mt-auto pb-3 pt-3 d-flex justify-content-around">
                                                    <a href="/product/${product.id}" class="btn btn-sm" >View
                                                        Details</a>
                                                    <a href="/cart/add/${product.id}" class="btn btn-sm" style="background-color: #d5449b;">Add to
                                                        Cart</a>
                                                </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>



<jsp:include page="../include/footer.jsp"/>