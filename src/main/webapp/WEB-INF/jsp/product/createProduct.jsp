<%-- JSTL --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="../include/header.jsp"/>

<%--load external signup css --%>
<link href="/pub/css/createProduct.css" rel="stylesheet">

<section class="bg-light1 pt-4 pb-4">
    <div class="container">
        <div class="row">
            <h1 class="m-0 text-center">Create Product</h1>
        </div>
    </div>
</section>


<section class="body-bg pt-1 pb-5">
    <div class="container">
        <div class="form-col">
            <!--title of form-->
            <div class="form-title ">
                <span style="font-size: 25px">Product Details</span>
            </div>

            <form action="/product/create-product" METHOD="POST" enctype="multipart/form-data">
                <input type="hidden" name="id" value="${form.id}"/>
                <div class="form-content">
                    <div class="mt-3 row justify-content-center" style="padding-right: 120px">
                        <label for="name" class="col-sm-2 col-form-label"> Name</label>
                        <div class="col-sm-10 col-lg-6">
                            <input type="text" class="form-control" id="name" name="name" value="${form.name}"
                                   style="padding: 11px; width:500px; font-size: medium; border:1px solid; border-radius:7px; border-color: lightgrey;">
                        </div>
                    </div>
                    <c:if test="${bindingResult.hasFieldErrors('name')}">
                        <div class="row justify-content-center">
                            <div class="col-sm-2"></div>
                            <div class="col-sm-10 col-lg-6">
                                <c:forEach var="error" items="${bindingResult.getFieldErrors('name')}">
                                    <dd class="mb-0 form-input-error">${error.getDefaultMessage()}</dd>
                                </c:forEach>
                            </div>
                        </div>
                    </c:if>


                    <div class="mt-3 row justify-content-center" style="padding-right: 120px">
                        <label for="category" class="col-sm-2 col-form-label">Category</label>
                        <div class="col-sm-10 col-lg-6">
                            <select id="category" name="category" class="form-control"
                                    style="padding: 11px; width:500px; font-size: medium; border:1px solid; border-radius:7px; border-color: lightgrey;">
                                <option></option>
                                <option>Paintings</option>
                                <option>Pottery</option>
                                <option>Bamboo Artifacts</option>
                                <option>Wall Hangings</option>
                                <option>Sculptures</option>
                                <option>Cultural Handicrafts</option>
                                <option>Wooden Handicrafts</option>
                                <option>Ceramic Kitchenware</option>
                            </select>
                        </div>
                    </div>
                    <c:if test="${bindingResult.hasFieldErrors('category')}">
                        <div class="row justify-content-center">
                            <div class="col-sm-2"></div>
                            <div class="col-sm-10 col-lg-6">
                                <c:forEach var="error" items="${bindingResult.getFieldErrors('category')}">
                                    <dd class="mb-0 form-input-error">${error.getDefaultMessage()}</dd>
                                </c:forEach>
                            </div>
                        </div>
                    </c:if>


                    <div class="mt-3 row justify-content-center" style="padding-right: 120px" >
                        <label for="description" class="col-sm-2 col-form-label">Description</label>
                        <div class="col-sm-10 col-lg-6">
                            <input type="text" class="form-control" id="description" name="description"
                                   value="${form.description}"
                                   style="padding: 11px; width:500px; font-size: medium; border:1px solid; border-radius:7px; border-color: lightgrey;">
                        </div>
                    </div>
                    <c:if test="${bindingResult.hasFieldErrors('description')}">
                        <div class="row justify-content-center">
                            <div class="col-sm-2"></div>
                            <div class="col-sm-10 col-lg-6">
                                <c:forEach var="error" items="${bindingResult.getFieldErrors('description')}">
                                    <dd class="mb-0 form-input-error">${error.getDefaultMessage()}</dd>
                                </c:forEach>
                            </div>
                        </div>
                    </c:if>


                    <div class="mt-3 row justify-content-center" style="padding-right: 120px">
                        <label for="price" class="col-sm-2 col-form-label">Price</label>
                        <div class="col-sm-10 col-lg-6">
                            <input type="text" class="form-control" id="price" name="price" value="${form.price}"
                                   style="padding: 11px; width:500px; font-size: medium; border:1px solid; border-radius:7px; border-color: lightgrey;">
                        </div>
                    </div>
                    <c:if test="${bindingResult.hasFieldErrors('price')}">
                        <div class="row justify-content-center">
                            <div class="col-sm-2"></div>
                            <div class="col-sm-10 col-lg-6">
                                <c:forEach var="error" items="${bindingResult.getFieldErrors('price')}">
                                    <dd class="mb-0 form-input-error">${error.getDefaultMessage()}</dd>
                                </c:forEach>
                            </div>
                        </div>
                    </c:if>


                    <div class="mt-3 row justify-content-center" style="padding-right: 120px">
                        <label for="stockQuantity" class="col-sm-2 col-form-label">Quantity in Stock</label>
                        <div class="col-sm-10 col-lg-6">
                            <input type="text" class="form-control" id="stockQuantity" name="stockQuantity"
                                   value="${form.stockQuantity}"
                                   style="padding: 11px; width:500px; font-size: medium; border:1px solid; border-radius:7px; border-color: lightgrey;">
                        </div>
                    </div>
                    <c:if test="${bindingResult.hasFieldErrors('stockQuantity')}">
                        <div class="row justify-content-center">
                            <div class="col-sm-2"></div>
                            <div class="col-sm-10 col-lg-6">
                                <c:forEach var="error" items="${bindingResult.getFieldErrors('stockQuantity')}">
                                    <dd class="mb-0 form-input-error">${error.getDefaultMessage()}</dd>
                                </c:forEach>
                            </div>
                        </div>
                    </c:if>


<%--                    <div class="mt-3 row justify-content-center" style="padding-right:120px">--%>
<%--                        <label for="userId" class="col-sm-2 col-form-label">Artisan</label>--%>
<%--                        <div class="col-sm-10 col-lg-6">--%>
<%--                            <select id="userId" name="user" class="form-control"--%>
<%--                                    style="padding: 11px; width:500px; font-size: medium; border:1px solid; border-radius:7px; border-color: lightgrey;">--%>
<%--                                <option></option>--%>
<%--                                <c:forEach var="user" items="${artisanFound}">--%>
<%--                                    <option value="${user.id}"--%>
<%--                                            <c:if test="${form.userId eq user.id}">selected</c:if>--%>
<%--                                    >${user.fullName}</option>--%>
<%--                                </c:forEach>--%>
<%--                            </select>--%>
<%--                        </div>--%>
<%--                    </div>--%>


                    <div class="mt-3 row justify-content-center" style="padding-right: 120px">
                        <label for="upload" class="col-sm-2 col-form-label">Upload Image</label>
                        <div class="col-sm-10 col-lg-6">
                            <input type="file" class="form-control" id="upload" name="upload"
                                   style="padding: 11px; width:500px; font-size: medium; border:1px solid; border-radius:7px; border-color: lightgrey;">
                        </div>
                    </div>


                    <div class="mt-3 row justify-content-center" style="padding-top: 10px; padding-bottom: 10px">
                        <div class="col-sm-8 col-lg-2">
                            <button type="submit" class="btn">Submit</button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</section>


<jsp:include page="../include/footer.jsp"/>
