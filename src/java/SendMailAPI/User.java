package SendMailAPI;


public class User {
    
    private String email;
    private String code;

    public User(String email, String code) {
        this.email = email;
        this.code = code;
    }

    public User() {
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }
    
}
