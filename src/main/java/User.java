import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

public class User {

    private Long id;
    private String firstName;
    private String lastName;
    private String email;
    private String phoneNumber;
    private LocalDate dateOfBirth;
    private LocalDateTime createdAt;
    private List<Bookings> bookings;
    private List<Reviews> reviews;

}
