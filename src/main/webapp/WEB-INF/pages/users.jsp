<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="jakarta.tags.core" %>

<t:pageTemplate pageTitle="Users">
    <h1>Users</h1>
    <c:if test="${pageContext.request.isUserInRole('WRITE_USERS')}">
        <a href="${pageContext.request.contextPath}/AddUser" class="btn btn-primary btn-lg">Add User</a>
    </c:if>
    <table class="table table-striped">
        <thead>
        <tr>
            <th>Username</th>
            <th>Email</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="user" items="${users}">
            <tr>
                <td>${user.username}</td>
                <td>${user.email}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</t:pageTemplate>