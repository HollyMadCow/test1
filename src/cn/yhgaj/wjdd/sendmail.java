package cn.yhgaj.wjdd;

import java.io.IOException;
import java.net.SocketException;
import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.mail.*;
import javax.mail.internet.*;
import javax.activation.*;

public class sendmail {
    public static void  sendmsgmail(String mailaddr,String mailtitle) throws IOException {
       String  host = "smtp.sina.com";
        String user = "zlwh2y@sina.com";
       String  pwd = "wohaoyumen";
        String from="zlwh2y@sina.com";
//        String to = mailaddr;
//        String subject=mailtitle;
        String content ="test";
        Properties props = new Properties();


        // 设置发送邮件的邮件服务器的属性（这里使用网易的smtp服务器）
        props.put("mail.smtp.host", host);
        // 需要经过授权，也就是有户名和密码的校验，这样才能通过验证（一定要有这一条）
        props.put("mail.smtp.auth", "true");


        // 用刚刚设置好的props对象构建一个session
        Session session = Session.getDefaultInstance(props);


        // 有了这句便可以在发送邮件的过程中在console处显示过程信息，供调试使
        // 用（你可以在控制台（console)上看到发送邮件的过程）
        session.setDebug(true);


        // 用session为参数定义消息对象
        MimeMessage message = new MimeMessage(session);
        try {
            // 加载发件人地址
            message.setFrom(new InternetAddress(from));
            // 加载收件人地址
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(mailaddr));
            // 加载标题
            message.setSubject(mailtitle);


            // 向multipart对象中添加邮件的各个部分内容，包括文本内容和附件
            Multipart multipart = new MimeMultipart();


            // 设置邮件的文本内容
            BodyPart contentPart = new MimeBodyPart();
            contentPart.setText(content);
            multipart.addBodyPart(contentPart);
           /* // 添加附件
            BodyPart messageBodyPart = new MimeBodyPart();
            DataSource source = new FileDataSource(affix);
            // 添加附件的内容
            messageBodyPart.setDataHandler(new DataHandler(source));
            // 添加附件的标题
            // 这里很重要，通过下面的Base64编码的转换可以保证你的中文附件标题名在发送时不会变成乱码
            sun.misc.BASE64Encoder enc = new sun.misc.BASE64Encoder();
            messageBodyPart.setFileName("=?GBK?B?"
                    + enc.encode(affixName.getBytes()) + "?=");
            multipart.addBodyPart(messageBodyPart);*/
            // 将multipart对象放到message中
            message.setContent(multipart);
            // 保存邮件
            message.saveChanges();
            // 发送邮件
            Transport transport = session.getTransport("smtp");
            // 连接服务器的邮箱
            transport.connect(host, user, pwd);
            // 把邮件发送出去
            transport.sendMessage(message, message.getAllRecipients());
            transport.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
//        String to = mailaddr;
//
//        // 发件人的电子邮件 ID
//        String from = "zlwh2y@163.com";
//
//        // 假设您是从本地主机发送电子邮件
//        String host = "smtp.qq.com";
//
//        // 获取系统的属性
//        Properties properties = System.getProperties();
//
//        // 设置邮件服务器
//        properties.setProperty("mail.smtp.host", host);
//        properties.setProperty("mail.smtp.auth","true");
//        properties.setProperty("mail.smtp.user", "2826358@qq.com");
//        properties.setProperty("mail.smtp.password", "cuubspcgwhoqbjfb");
//        properties.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
//        properties.setProperty("mail.smtp.port", "465");
//        properties.setProperty("mail.smtp.socketFactory.port", "465");
//
//        // 获取默认的 Session 对象
//        Session session = Session.getDefaultInstance(properties);
//        session.setDebug(true);
//        // 设置响应内容类型
//
//
//        try{
//            // 创建一个默认的 MimeMessage 对象
//            MimeMessage message = new MimeMessage(session);
//            // 设置 From: header field of the header.
//            message.setFrom(new InternetAddress(from));
//            // 设置 To: header field of the header.
//            message.addRecipient(Message.RecipientType.TO,
//                    new InternetAddress(to));
//            // 设置 Subject: header field
//            message.setSubject(mailtitle);
//            // 现在设置实际消息
//            message.setText("This is actual message");
//            // 发送消息
//            Transport.send(message);
//            String title = "发送电子邮件";
//            String res = "成功发送消息...";
//
//
//        }catch (MessagingException mex) {
//            mex.printStackTrace();
//        }

    }
}
