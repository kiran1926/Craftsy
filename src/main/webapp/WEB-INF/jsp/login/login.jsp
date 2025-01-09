<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%--header line here --%>
<jsp:include page="../include/header.jsp"/>

<%--load external signup css --%>
<link href="/pub/css/login.css" rel="stylesheet">


<section class="body-bg pt-5 pb-5">
    <div class="container">
        <div class="form-col">
            <!--title of form-->
            <div class="form-title">
                <span style="font-size: 25px">Log In</span>
            </div>

            <!-- this form has to submit to the .loginProcessingUrl we configured in the spring security config -->
            <!--  and this must be a method-POST -->
            <!-- the name of the input field MUST BE username -->
            <!-- name of the password fields MUST BE password -->
            <c:if test="${param.error eq ''}">
                <div class="row justify-content-center">
                    <div class="col-6 alert alert-danger" role="alert">
                        Invalid username or password
                    </div>
                </div>
            </c:if>
            <!-- Display logout message if 'logout' parameter is not empty -->
            <c:if test="${not empty param.logout}">
                <div class="alert alert-success" role="alert">
                    You have been logged out successfully.
                </div>
            </c:if>

            <form action="/login/loginSubmit" method="post">
              <div class="form-content">
              <!--Input box for email or username-->
                <div class="mt-3 row justify-content-center" style="padding-right: 90px;">
                  <div class="col-sm-6 col-lg-8">
                    <label for="username" class="col-form-label d-block">Username*</label>
                    <input type="text" class="form-control" id="username" name="username"
                           placeholder="Your Email *"
                           value=""
                           style="padding: 11px; width:300px; font-size: medium; border:1px solid; border-radius:7px; border-color: lightgrey;">
                  </div>
                </div>

                <!--Input box for password-->
                <div class="mt-3 row justify-content-center" style="padding-right: 90px;">
                  <div class="col-sm-6 col-lg-8">
                    <!-- Label on its own line -->
                    <label for="password" class="col-form-label d-block">Password*</label>
                    <!-- Input box on the next line -->
                    <input type="text" class="form-control" id="password" name="password"
                           placeholder="Your Password *" value=""
                           style="padding: 11px; width: 300px; font-size: medium; border: 1px solid; border-radius: 7px; border-color: lightgrey;">
                  </div>
                </div>

                <!--checkbox for keep me logged in-->
                <div class="form-check mt-2" style="padding-right: 120px;">
                    <input type="checkbox" class="form-check-input custom-checkbox" id="keepMeLoggedIn" name="keepMeLoggedIn" style=" border:2px solid; border-radius:4px; border-color: lightgrey;">
                    <label class="form-check-label" for="keepMeLoggedIn">Keep me logged in</label>
                </div>

                <div class="mt-4 row justify-content-center" style="padding-right: 15px;">
                  <div class="col-sm-8 col-lg-4">
                    <button type="submit" class="btn">Login</button>
                  </div>
                </div>

                <!--don't have account-->
                <div class="No-acc" style="padding-top: 20px; text-align: center;">
                  <span style="font-size: 15px; text-decoration: underline; text-decoration-color: rgb(157, 153, 153);">Don't have an account?</span>
                  <br>
                  <!--TODO !!!!!! add link here later-->
                  <a class="nav-link active" aria-current="page" href="login/signup" style="font-size: large; color: #711A4E; font-weight: 600;">SIGN UP</a>
                </div>

              </div>
            </form>
        </div>
    </div>
</section>

<jsp:include page="../include/footer.jsp"/>