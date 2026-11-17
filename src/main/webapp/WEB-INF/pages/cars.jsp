<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="jakarta.tags.core" %>

<t:pageTemplate pageTitle="Cars">
    <h1>Cars</h1>
    <table class="table table-striped">
        <thead>
        <tr>
            <th>License Plate</th>
            <th>Parking Spot</th>
            <th>Owner</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="car" items="${cars}">
            <tr>
                <td>${car.licensePlate}</td>
                <td>${car.parkingSpot}</td>
                <td>${car.ownerName}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <h5 class="mt-4">Free parking spots: ${numberOfFreeParkingSpots}</h5>
</t:pageTemplate>