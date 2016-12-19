<%-- 
    Document   : profile
    Created on : Dec 18, 2016, 5:42:01 PM
    Author     : user
--%>

<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Index</title>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/form.css" rel="stylesheet" type="text/css" media="all" />
        <link href='http://fonts.googleapis.com/css?family=Exo+2' rel='stylesheet' type='text/css'>
        <script type="text/javascript" src="js/jquery1.min.js"></script>
        <!-- start menu -->
        <link href="css/megamenu.css" rel="stylesheet" type="text/css" media="all" />
        <script type="text/javascript" src="js/megamenu.js"></script>
        <script>$(document).ready(function () {
                $(".megamenu").megamenu();
            });</script>
        <!--start slider -->
        <link rel="stylesheet" href="css/fwslider.css" media="all">
        <script src="js/jquery-ui.min.js"></script>
        <script src="js/css3-mediaqueries.js"></script>
        <script src="js/fwslider.js"></script>
        <!--end slider -->
        <script src="js/jquery.easydropdown.js"></script>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>

        <%
            User user = (User) session.getAttribute("user");

        %>
        <div class="main">
            <div class="wrap">
                <div class="section group">
                    <div class="cont span_2_of_3">
                        <h2 class="head">INFORMATION</h2>
                        <div class="top-box">
                            <div class="col_3_of_3 span_3_of_3">
                                <form action="#" >
                                    <h3 >User name :</h3> <input type="text" disabled="true" value="<%=user.getUser_name()%>"/> 
                                    <h3 >Email : </h3><input type="text" disabled="true" value="<%=user.getUser_email()%>"/>
                                    <h3 >Phone number : </h3> <input type="text" disabled="true" value="<%=user.getUser_phonenumber()%>"/>
                                </form>
                            </div>
                            <div class="clear"></div>
                        </div>
                        <h2 class="head">BILLS</h2>
                        <div class="top-box">

                            <div class="clear"></div>
                        </div>

                    </div>

                    <div class="clear"></div>
                </div>
            </div>
        </div>

        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>