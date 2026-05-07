import java.time.LocalDate;
import java.time.LocalDateTime;

public class Reviews {

    private Long id;
    private Long userId;
    private Long tripId;
    private int rating;
    private String comment;
    private boolean recommended;
    private LocalDate reviewDate;
    private LocalDateTime createdAt;

}
