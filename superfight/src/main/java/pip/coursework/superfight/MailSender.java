package pip.coursework.superfight;
import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;
import javax.activation.*;

// Отправка простого сообщения с типом контента "text/plain"
public class MailSender {

    public static void send(String subject,String text,String recipient) {

        String from = "Superfight";
        // Сюда необходимо подставить SMTP сервер, используемый для отправки
        String host = "smtp.gmail.com";
        // Тут указываем порт SMTP сервера.
        int port = 465;

        // Создание свойств, получение сессии
        Properties props = new Properties();

        // При использовании статического метода Transport.send()
        // необходимо указать через какой хост будет передано сообщение
        props.put("mail.smtp.host", host);
        // Если почтовый сервер использует SSL
        props.put("mail.smtp.ssl.enable", "true");
        // Указываем порт SMTP сервера. 
        props.put("mail.smtp.port", port);
        // Большинство SMTP серверов, используют авторизацию.
        props.put("mail.smtp.auth", "true");
        // Включение debug-режима
       // props.put("mail.debug", "true");
        // Авторизируемся.
        Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
            // Указываем логин пароль, от почты, с которой будем отправлять сообщение.
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("dmitrybaev1@gmail.com", "Cldyvcgaj1!");
            }
        });

        try {
            // Создание объекта сообщения
            Message msg = new MimeMessage(session);

            // Установка атрибутов сообщения
            msg.setFrom(new InternetAddress(from));
            InternetAddress[] address = {new InternetAddress(recipient)};
            msg.setRecipients(Message.RecipientType.TO, address);
            msg.setSubject(subject);
            msg.setSentDate(new Date());

            // Установка тела сообщения
            msg.setText(text);

            // Отправка сообщения
            Transport.send(msg);
        }
        catch (MessagingException mex) {
            // Печать информации об исключении в случае его возникновения
            mex.printStackTrace();
        }
    }
}