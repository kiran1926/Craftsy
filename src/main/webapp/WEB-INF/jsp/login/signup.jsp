<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="../include/header.jsp"/>


<section class="bg-header pt-5 pb-5">
    <div class="container">
        <div class="row">
            <h1 class="m-0 text-center">Sign Up</h1>
        </div>
    </div>
</section>

<section class="bg-light1 pt-5 pb-5">
    <div class="container">
        <!--title of form-->
        <div class="form-title">
            <span style="font-size: 25px">Sign Up</span>
        </div>

        <form action="/login/signupSubmit" method="post">
            <!--Input box for email or username-->
            <div class="mt-3 row justify-content-center">
                <label for="username" class="col-sm-2 col-form-label">Username *</label>
                <div class="col-sm-10 col-lg-6">
                    <input type="text" class="form-control" id="username" name="username" placeholder="Your Email *" value=""
                           style="padding: 11px; width:300px; font-size: medium; border:1px solid; border-radius:7px; border-color: lightgrey;">
                </div>
            </div>
            <c:if test="${bindingResult.hasFieldErrors('username')}">
                <div class="row justify-content-center">
                    <div class="col-sm-2"></div>
                    <div class="col-sm-10 col-lg-6">
                        <c:forEach var="error" items="${bindingResult.getFieldErrors('username')}">
                            <dd class="mb-0 form-input-error">${error.getDefaultMessage()}</dd>
                        </c:forEach>
                    </div>
                </div>
            </c:if>

            <!--Input box for password-->
            <div class="mt-3 row justify-content-center">
                <label for="password" class="col-sm-2 col-form-label">Password *</label>
                <div class="col-sm-10 col-lg-6">
                    <input type="text" class="form-control" id="password" name="password" placeholder="Your Password *"  value=""
                           style="padding: 11px; width:300px; font-size: medium; border:1px solid; border-radius:7px; border-color: lightgrey">
                </div>
            </div>
            <c:if test="${bindingResult.hasFieldErrors('password')}">
                <div class="row justify-content-center">
                    <div class="col-sm-2"></div>
                    <div class="col-sm-10 col-lg-6">
                        <c:forEach var="error" items="${bindingResult.getFieldErrors('password')}">
                            <dd class="mb-0 form-input-error">${error.getDefaultMessage()}</dd>
                        </c:forEach>
                    </div>
                </div>
            </c:if>

            <div class="mt-3 row justify-content-center">
                <label for="fullname" class="col-sm-2 col-form-label">Full Name *</label>
                <div class="col-sm-10 col-lg-6">
                    <input type="text" class="form-control" id="fullname" name="fullname" placeholder="Your Full Name" value=""
                           style="padding: 11px; width:300px; font-size: medium; border:1px solid; border-radius:7px; border-color: lightgrey">
                </div>
            </div>
            <c:if test="${bindingResult.hasFieldErrors('fullname')}">
                <div class="row justify-content-center">
                    <div class="col-sm-2"></div>
                    <div class="col-sm-10 col-lg-6">
                        <c:forEach var="error" items="${bindingResult.getFieldErrors('fullname')}">
                            <dd class="mb-0 form-input-error">${error.getDefaultMessage()}</dd>
                        </c:forEach>
                    </div>
                </div>
            </c:if>

            <div class="mt-3 row justify-content-center">
                <div class="col-sm-12 col-lg-8">
                    <button type="submit" class="btn btn-primary">Submit</button>
                </div>
            </div>
        </form>
    </div>
</section>


<jsp:include page="../include/footer.jsp"/>