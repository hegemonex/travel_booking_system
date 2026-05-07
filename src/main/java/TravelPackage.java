import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

public class TravelPackage {

    private Long id;
    private String name;
    private String description;
    private double packagePrice;
    private boolean active;
    private LocalDate startDate;
    private LocalDate endDate;
    private LocalDateTime createdAt;
    private List<Trips> trips;

}
