package com.serviceimp;

import com.bean.Email;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bean.User;
import com.dao.UserDao;
import com.service.UserService;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;
import java.util.Random;

@Service
public class UserServiceImp implements UserService {
    @Autowired
    UserDao userdao;
    //获取验证码
	@Override
	public String check(String email) {
		Email mail = new Email();
		//发件人的邮箱地址（要完整），会显示在收件人的邮件中
		mail.setSender("haiyuzhixin@qq.com");
		//发件人登录邮箱的账号（@符合前面的部分）
		mail.setUserName("haiyuzhixin");
		//下面填的是邮箱客户端授权码，切忌：邮箱务必要开启（POP3/SMTP服务）
		//mail.setPassword("tipjlzgamyzadfgc");//zjuwekswifjndejf
		mail.setPassword("zjuwekswifjndejf");
		String pass1 = null;
		try {
			//创建邮件对象
			Session session = null;
			Properties props = new Properties();
			//此处为发送方邮件服务器地址，要根据邮箱的不同需要自行设置
			props.put("mail.smtp.host", "smtp.qq.com");
			props.setProperty("mail.transport.protocol", "smtp");
			//SMTP端口号
			props.put("mail.smtp.port", "587");//经测试25和465端口都无法使用
			//设置成需要邮件服务器认证
			props.put("mail.smtp.auth", "true");
			props.put("mail.debug", "true");
			session = Session.getInstance(props);
			session.setDebug(true);
			Message message = new MimeMessage(session);
			// 设置发件人
			message.setFrom(new InternetAddress(mail.getSender()));
			// 设置收件人
			message.addRecipient(Message.RecipientType.BCC.TO, new InternetAddress(email));
			// 设置标题
			message.setSubject("懒人科技邮件");
			//邮件内容，根据自己需要自行制作模板
			//获取随机验证码
			Random r = new Random();
			double pass = (1 + r.nextDouble()) * Math.pow(10, 6);
			String fixLenthString = String.valueOf(pass);
			pass1 = fixLenthString.substring(1, 7);
			message.setContent("<p>尊敬的冰用户：</p><p>您好!</p><p>您正在登录**系统！"
					+ "您的验证码是：'" + pass1 + "'。</p><p>请妥善保管您的账号和密码。</p>"
					+ "<p>祝您生活愉快</p>", "text/html;charset=utf-8");
			//发送邮件
			Transport transport = session.getTransport("smtp");
			transport.connect("smtp.qq.com", mail.getUserName(), mail.getPassword());//以smtp方式登录邮箱
			//发送邮件,其中第二个参数是所有已设好的收件人地址
			transport.sendMessage(message, message.getAllRecipients());
			transport.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pass1;
	}

	//登录
	@Override
	public String login(String username, String password) {
		// TODO Auto-generated method stub
		User u = userdao.login(username,password);
		String flag = "false";//登录不成功
		if(u!=null){
			if(u.getPassword().equals(password)){
				flag = "true";//登录成功
			}
		}
		return flag;
	}
	//注册
	@Override
	public User register(String username, String password) {
		// TODO Auto-generated method stub
		User u = userdao.login(username,password);
		if(u==null){
			userdao.register(username, password);
			System.out.println("注册成功");
		}else{
			System.out.println("已经存在该账号");
		}
		return u;
	}

}
