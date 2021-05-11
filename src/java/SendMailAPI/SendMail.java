package SendMailAPI;

import java.util.Properties;
import java.util.Random;
import javax.mail.*;
import javax.net.*;
import javax.mail.internet.*;

public class SendMail {

    public String getRandom() {
        Random rnd = new Random();
        int number = rnd.nextInt(999999);
        return (String.format("%06d", number));
    }

    public boolean sendEmail(User user) {
        boolean test = false;
        String toEmail;
        toEmail = user.getEmail();

        String fromEmail = "dhirajdunani2001@gmail.com";
        String password = "dhiru2001";
        System.out.println("here") ;     
        try {
            Properties props = new Properties();
            props.put("mail.smtp.host", "smtp.gmail.com");
            props.put("mail.smtp.socketFactory.port", "465");
            props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.port", "465");

            Session session = Session.getInstance(props, new javax.mail.Authenticator() {

                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(fromEmail, password);
                }

            });

            MimeMessage mess = new MimeMessage(session);

            mess.addRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
            mess.setFrom(new InternetAddress(fromEmail));
            mess.setSubject("Email verification From Dr.Fuel");
            mess.setText("To set the password enter the following code:" + user.getCode());

            Transport.send(mess);
            test = true;

        } catch (Exception e) {
            System.out.println("exceptio in mail" + e);
        }

        return test;
    }

}
