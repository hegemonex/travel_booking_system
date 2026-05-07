import java.time.LocalDate;
import java.time.LocalDateTime;

public class Payments {

    private Long id;
    private Long bookingId;
    private String paymentMethod;
    private double amount;
    private boolean successful;
    private LocalDate paymentDate;
    private LocalDateTime createdAt;

}
