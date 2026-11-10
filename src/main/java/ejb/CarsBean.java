package ejb;

import common.CarDto;
import entities.Car;
import jakarta.ejb.EJBException;
import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.TypedQuery;

import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

@Stateless
public class CarsBean {

    private static final Logger LOG = Logger.getLogger(CarsBean.class.getName());

    @PersistenceContext
    EntityManager entityManager;

    public List<CarDto> findAllCars() {
        LOG.info("findAllCars");
        try {
            TypedQuery<Car> typedQuery = entityManager.createQuery("SELECT c FROM Car c", Car.class);
            List<Car> cars = typedQuery.getResultList();
            return copyCarsToDto(cars);
        } catch (Exception ex) {
            throw new EJBException(ex);
        }
    }

    private List<CarDto> copyCarsToDto(List<Car> cars) {
        List<CarDto> carDtos = new ArrayList<>();
        for (Car car : cars) {
            carDtos.add(new CarDto(
                    car.getId(),
                    car.getLicensePlate(),
                    car.getParkingSpot(),
                    car.getOwner().getUsername()));
        }
        return carDtos;
    }

    // kept from your ParkingService
    public long countFreeParkingSpots(int totalSpots) {
        LOG.info("countFreeParkingSpots");
        try {
            Long occupied = entityManager.createQuery(
                            "SELECT COUNT(c) FROM Car c WHERE c.parkingSpot IS NOT NULL", Long.class)
                    .getSingleResult();
            return totalSpots - occupied;
        } catch (Exception ex) {
            throw new EJBException(ex);
        }
    }
}