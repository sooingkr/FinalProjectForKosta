<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

 <!-- START TALK TO US SECTION -->
            <div class="f-page yellow-bkg active" class="f-page yellow-bkg" id="screen-talk-to-us">
                <!-- START HEADER -->
                <header class="site-header yellow">
                <span class="nav-trigger">
                    <span class="nav-trigger-inside">
                        <span class="nav-trigger-line"></span>
                    </span>
                </span>
                <!-- START NAVIGATION MENU -->
                
			 <%@include file="/WEB-INF/views/layout/navigationImport.jsp" %>
                
                <!-- END NAVIGATION MENU -->
                <!-- START SOCIAL ICON -->
			 <%@include file="/WEB-INF/views/layout/socialIconImport.jsp" %>
                <!-- END SOCIAL ICON -->
            </header>
                <!-- END HEADER -->
                <section class="site-content full-height"><div class="content-frame"> 
                    <div id="form-contact">
                        <h1 id="hello">SAY 'HELLO'</h1>
                        <button class="button" value="Show map">SHOW MAP</button>
                            <div id="googlemap">
                                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d7407.084900169444!2d73.71531610873852!3d21.836602579155294!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x39601e76cfab0f2f%3A0xde6b6769555c29d9!2sStatue+of+Unity!5e0!3m2!1sen!2sin!4v1457959783722" width="100%" height="300" frameborder="0" style="border:0" allowfullscreen></iframe>
                            </div>
                        <form id="contactform" action="mail_handler.php" method="post" onsubmit="return ValidatorForm(this)">
                            <div class="formfield clearfix">
                                <div class="col1">
                                    <div class="input-holder">
                                        <input type="text" name="name" class="text" id="name" placeholder="YOUR NAME" />
                                    </div>
                                </div>
                                <div class="col1 second">
                                    <div class="input-holder">
                                        <input type="text" name="email" class="text" id="email" placeholder="YOUR E-MAIL" />
                                    </div>
                                </div>
                                <div class="col1 last">
                                    <div class="input-holder">
                                        <input type="text" name="phone" class="text" id="phone" placeholder="YOUR PHONE NUMBER" />
                                    </div>
                                </div>
                            </div>
                            <div class="formfield">
                                <div class="input-holder">
                                    <textarea id="message" name="message" placeholder="YOUR MESSAGE"></textarea>
                                </div>
                            </div>
                            <input id="send-message" name="submit" type="submit" value="SEND MESSAGE" />
                            <p class="call">OR IF YOU PREFER TALKING ON PHONE JUST CALL US - +11 1  23456789</p>
                            <span id="result"></span>
                        </form>
                    </div></div>
                </section>
            </div>
            <!-- END TALK TO US SECTION -->
            
            
      <!-- 각 페이지별 메뉴 색깔 제어 -->
<script>
	$(document).ready(function(){
		$("#talktous").attr("class","active");
	})
</script>
