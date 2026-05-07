import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

public class Trips {

    private Long id;
    private Long hotelId;
    private Long flightId;
    private Long transportId;
    private Long PackageId;
    private String title;
    private String description;
    private double price;
    private boolean availabe;
    private LocalDate departureDate;
    private LocalDate returnDate;
    private LocalDateTime createdAt;
    private List<Destinations> destinations;
    private List<Reviews> reviews;

}
