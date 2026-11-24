package Servlets;

import common.CarDto;
import ejb.CarsBean;
import jakarta.inject.Inject;
import jakarta.annotation.security.DeclareRoles;
import jakarta.servlet.annotation.HttpConstraint;
import jakarta.servlet.annotation.HttpMethodConstraint;
import jakarta.servlet.annotation.ServletSecurity;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

import java.util.ArrayList;

@DeclareRoles({"READ_CARS", "WRITE_CARS"})
@ServletSecurity(value = @HttpConstraint(rolesAllowed = {"READ_CARS"}),
        httpMethodConstraints = {@HttpMethodConstraint(value = "POST", rolesAllowed = {"WRITE_CARS"})})
@WebServlet(name = "Cars", value = "/Cars")
public class Cars extends HttpServlet {

    @Inject
    CarsBean carsBean;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<CarDto> cars = carsBean.findAllCars();

        request.setAttribute("cars", cars);
        request.setAttribute("numberOfFreeParkingSpots", carsBean.countFreeParkingSpots(10));
        request.setAttribute("activePage", "Cars");
        request.getRequestDispatcher("/WEB-INF/pages/cars.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String[] carIdsAsString = request.getParameterValues("car_ids");
        if (carIdsAsString != null) {
            List<Long> carIds = new ArrayList<>();
            for (String carIdAsString : carIdsAsString) {
                carIds.add(Long.parseLong(carIdAsString));
            }
            carsBean.deleteCarsByIds(carIds);
        }
        response.sendRedirect(request.getContextPath() + "/Cars");
    }
}