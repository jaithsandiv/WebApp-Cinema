/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.webapp.cinema.controller;

import java.util.Properties;
import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;

public class EmailSenderCTL {
     public static void sendEmailWithHtml(String toEmail, String subject, String htmlContent) {
        String fromEmail = "chanodyapraveen@gmail.com"; // Replace with your email
        String password = "sttg jdnj svwn uejh";          // Replace with your email password
// set up and sen the email
        Properties props = new Properties();
        props.put("mail.debug", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        Session session = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(fromEmail, password);
            }
        });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress("chanodyapraveen@gmail.com"));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse("chanodyapraveen@gmail.com"));
            message.setSubject("This is your E-ticket");

            // Set the email content to HTML
            message.setContent(htmlContent, "text/html");

            Transport.send(message);
            System.out.println("HTML email sent successfully to " + toEmail);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}   


