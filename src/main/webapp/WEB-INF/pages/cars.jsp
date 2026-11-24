<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="jakarta.tags.core" %>

<t:pageTemplate pageTitle="Cars">
    <h1>Cars</h1>
    <form method="POST" action="${pageContext.request.contextPath}/Cars">
        <c:if test="${pageContext.request.isUserInRole('WRITE_CARS')}">
            <a href="${pageContext.request.contextPath}/AddCar" class="btn btn-primary btn-lg">Add Car</a>
            <button class="btn btn-danger btn-lg" type="submit">Delete Cars</button>
        </c:if>

        <table class="table table-striped mt-3">
            <thead>
            <tr>
                <th></th>
                <th>License Plate</th>
                <th>Parking Spot</th>
                <th>Owner</th>
                <th></th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="car" items="${cars}">
                <tr>
                    <td>
                        <c:if test="${pageContext.request.isUserInRole('WRITE_CARS')}">
                            <input type="checkbox" name="car_ids" value="${car.id}"/>
                        </c:if>
                    </td>
                    <td>${car.licensePlate}</td>
                    <td>${car.parkingSpot}</td>
                    <td>${car.ownerName}</td>
                    <td>
                        <c:if test="${pageContext.request.isUserInRole('WRITE_CARS')}">
                            <a class="btn btn-secondary"
                               href="${pageContext.request.contextPath}/EditCar?id=${car.id}">Edit Car</a>
                        </c:if>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </form>
    <h5 class="mt-4">Free parking spots: ${numberOfFreeParkingSpots}</h5>
</t:pageTemplate>