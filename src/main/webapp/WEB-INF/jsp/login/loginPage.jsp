<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%--header line here --%>

<section class="bg-header pt-5 pb-5">
  <div class="container">
    <div class="row">
      <h1 class="m-0 text-center">Login</h1>
    </div>
  </div>
</section>

<section class="bg-light1 pt-5 pb-5">
  <div class="container">

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
      <div class="mt-3 row justify-content-center">
        <label for="username" class="col-sm-2 col-form-label">Username</label>
        <div class="col-sm-10 col-lg-6">
          <input type="text" class="form-control" id="username" name="username" value="">
        </div>
      </div>

      <div class="mt-3 row justify-content-center">
        <label for="password" class="col-sm-2 col-form-label">Password</label>
        <div class="col-sm-10 col-lg-6">
          <input type="text" class="form-control" id="password" name="password" value="">
        </div>
      </div>

      <div class="mt-3 row justify-content-center">
        <div class="col-sm-12 col-lg-8">
          <button type="submit" class="btn btn-primary">Submit</button>
        </div>
      </div>
    </form>
  </div>
</section>