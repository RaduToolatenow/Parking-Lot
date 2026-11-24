<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="jakarta.tags.core" %>

<t:pageTemplate pageTitle="Login">
    <h1>Sign In</h1>

    <c:if test="${not empty message}">
        <div class="alert alert-danger" role="alert">
            ${message}
        </div>
    </c:if>

    <form class="needs-validation" novalidate method="POST" action="j_security_check">
        <div class="row">
            <div class="col-md-6 mb-3">
                <label for="j_username">Username</label>
                <input type="text" class="form-control" id="j_username"
                       name="j_username" placeholder="" value="" required>
                <div class="invalid-feedback">
                    Username is required.
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-6 mb-3">
                <label for="j_password">Password</label>
                <input type="password" class="form-control" id="j_password"
                       name="j_password" placeholder="" required>
                <div class="invalid-feedback">
                    Password is required.
                </div>
            </div>
        </div>

        <hr class="mb-4">
        <button class="btn btn-primary btn-lg" type="submit">Sign In</button>
    </form>
</t:pageTemplate>
