<%-- 
    Document   : single
    Created on : 05-Oct-2016, 15:36:19
    Author     : admin
--%>

<%@page import="model.Mayanh"%>
<%@page import="dao.MayanhDAO"%>
<%@page import="model.Laptop"%>
<%@page import="dao.LaptopDAO"%>
<%@page import="model.Dienthoai"%>
<%@page import="dao.DienthoaiDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Single</title>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/form.css" rel="stylesheet" type="text/css" media="all" />
        <link href='http://fonts.googleapis.com/css?family=Exo+2' rel='stylesheet' type='text/css'>
        <script src="js/jquery1.min.js"></script>
        <!-- start menu -->
        <link href="css/megamenu.css" rel="stylesheet" type="text/css" media="all" />
        <script type="text/javascript" src="js/megamenu.js"></script>
        <script>$(document).ready(function () {
                $(".megamenu").megamenu();
            });</script>
        <script type="text/javascript" src="js/jquery.jscrollpane.min.js"></script>
        <script type="text/javascript" id="sourcecode">
            $(function ()
            {
                $('.scroll-pane').jScrollPane();
            });
        </script>
        <!-- start details -->
        <script src="js/slides.min.jquery.js"></script>
        <script>
            $(function () {
                $('#products').slides({
                    preload: true,
                    preloadImage: 'img/loading.gif',
                    effect: 'slide, fade',
                    crossfade: true,
                    slideSpeed: 350,
                    fadeSpeed: 500,
                    generateNextPrev: true,
                    generatePagination: false
                });
            });
        </script>
        <link rel="stylesheet" href="css/etalage.css">
        <script src="js/jquery.etalage.min.js"></script>
        <script>
            jQuery(document).ready(function ($) {

                $('#etalage').etalage({
                    thumb_image_width: 360,
                    thumb_image_height: 360,
                    source_image_width: 900,
                    source_image_height: 900,
                    show_hint: true,
                    click_callback: function (image_anchor, instance_id) {
                        alert('Callback example:\nYou clicked on an image with the anchor: "' + image_anchor + '"\n(in Etalage instance: "' + instance_id + '")');
                    }
                });

            });
        </script>
    </head>
    <body>
        <%
            String product_id = request.getParameter("product_id");;
            String s1 = product_id.substring(0, 2);

            DienthoaiDAO dienthoaiDAO = new DienthoaiDAO();
            Dienthoai dt = new Dienthoai();

            LaptopDAO laptopDAO = new LaptopDAO();
            Laptop lt = new Laptop();

            MayanhDAO mayanhDAO = new MayanhDAO();
            Mayanh ma = new Mayanh();
        %>

        <jsp:include page="header.jsp"></jsp:include>
            <!--main-->
            <div class="mens">    
                <div class="main">
                    <div class="wrap">
                        <ul class="breadcrumb breadcrumb__t"><a class="home" href="index.jsp">Home</a>/<a href="single.jsp">Single</a></ul>
                        <div class="cont span_2_of_3">
                        <%
                            if (s1.equals("dt")) {
                                dt = dienthoaiDAO.getDienthoai(product_id);
                        %>
                        <div class="grid images_3_of_2">

                            <ul id="etalage">
                                <%
                                    for (int i = 2; i < 6; i++) {
                                %>
                                <li>
                                    <a href="optionallink.html">
                                        <img class="etalage_thumb_image" src="<%="images/" + dt.getProduct_name() + " (" + i + ")" + ".jpg"%>" class="img-responsive" />
                                        <img class="etalage_source_image" src="<%="images/" + dt.getProduct_name() + " (" + i + ")" + "Copy" + ".jpg"%>" class="img-responsive" title="" />
                                    </a>
                                </li>  
                                <%
                                    }
                                %>
                            </ul>

                            <div class="clearfix"></div>
                        </div>
                        <div class="desc1 span_3_of_2">
                            <h3 class="m_3"><%=dt.getProduct_name()%></h3>
                            <%
                                if (dt.getCategory_id() == 3) {
                                    double d = dt.getProduct_price() - (dt.getProduct_price() * dt.getProduct_discount() / 100);
                            %>
                            <p class="m_5"><font color="red"><%=(double) Math.round((d * 1000) / 1000)%><span>0.000₫ </span></font><span class="reducedfrom"><%=dt.getProduct_price()%><span>0.000₫</span></span> <a href="#">click for offer</a></p>
                                <%
                                } else {
                                %>
                            <p class="m_5"><%=dt.getProduct_price()%><span>0.000₫</span><a href="#"> click for offer</a></p>
                            <%
                                }
                            %>
                            <div class="btn_form">
                                <form>
                                    <input type="submit" value="buy" title="">
                                </form>
                            </div>
                            <span class="m_link"><a href="#">login to save in wishlist</a></span>
                            <p class="m_text2">
                            <p>Màn hình: <%=dt.getProduct_resolution()%><p><br>
                            <p>Hệ điều hành: <%=dt.getProduct_os()%></p><br>
                            <p>Camera sau: <%=dt.getProduct_camera_after()%> MP</p><br>
                            <p>Camera trước: <%=dt.getProduct_camera_front()%> MP</p><br>
                            <p>CPU: <%=dt.getProduct_cpu()%></p><br>
                            <p>RAM: <%=dt.getProduct_ram()%> GB</p><br>
                            <p>Bộ nhớ trong: <%=dt.getProduct_memory()%> GB</p><br>
                            <p>Hỗ trợ thẻ nhớ: <%=dt.getProduct_mem_card()%></p><br>
                            <p>Thẻ SIM: <%=dt.getProduct_sim_card()%></p><br>
                            <p>Kết nối: <%=dt.getProduct_connection()%></p><br>
                            <p>Dung lượng pin: <%=dt.getProduct_battery()%> mAh</p><br>
                            <p>Thiết kế: <%=dt.getProduct_design()%></p><br>
                            <p>Chức năng đặc biệt: <%=dt.getProduct_extra_info()%></p>
                        </div>
                        <div class="clear"></div>	
                        <div class="clients">
                            <h3 class="m_3">Các sản phẩm khác cùng loại</h3>
                            <ul id="flexiselDemo3">
                                <%
                                    if (dt.getCategory_id() == 1) {
                                        for (Dienthoai d : dienthoaiDAO.getManyProduct(1)) {
                                %>
                                <li><img src="<%="images/" + d.getProduct_name() + " (1)" + ".jpg"%>" /><a href="single.jsp?product_id=<%=d.getProduct_id()%>"><%=d.getProduct_name()%></a></li>
                                    <%
                                        }
                                    } else if (dt.getCategory_id() == 2) {
                                        for (Dienthoai d : dienthoaiDAO.getManyProduct(2)) {
                                    %>
                                <li><img src="<%="images/" + d.getProduct_name() + " (1)" + ".jpg"%>" /><a href="single.jsp?product_id=<%=d.getProduct_id()%>"><%=d.getProduct_name()%></a></li>
                                    <%
                                        }
                                    } else if (dt.getCategory_id() == 3) {
                                        for (Dienthoai d : dienthoaiDAO.getManyProduct(3)) {
                                    %>
                                <li><img src="<%="images/" + d.getProduct_name() + " (1)" + ".jpg"%>" /><a href="single.jsp?product_id=<%=d.getProduct_id()%>"><%=d.getProduct_name()%></a></li>
                                    <%
                                            }
                                        }
                                    %>
                            </ul>
                            <%
                            } else if (s1.equals("mt")) {
                                lt = laptopDAO.getLaptop(product_id);
                            %>
                            <div class="grid images_3_of_2">
                                <ul id="etalage">
                                    <li>
                                        <a href="optionallink.html">
                                            <img class="etalage_thumb_image" src="<%="images/" + lt.getProduct_name() + ".jpg"%>" class="img-responsive" />
                                            <img class="etalage_source_image" src="<%="images/" + lt.getProduct_name() + ".jpg"%>" class="img-responsive" title="" />
                                        </a>
                                    </li>                                    
                                </ul>
                                <div class="clearfix"></div>
                            </div>
                            <div class="desc1 span_3_of_2">
                                <h3 class="m_3"><%=lt.getProduct_name()%></h3>
                                <%
                                    if (lt.getCategory_id() == 3) {
                                        double d = lt.getProduct_price() - (lt.getProduct_price() * lt.getProduct_discount() / 100);
                                %>
                                <p class="m_5"><font color="red"><%=(double) Math.round((d * 1000) / 1000)%><span>0.000₫ </span></font><span class="reducedfrom"><%=lt.getProduct_price()%><span>0.000₫</span></span> <a href="#">click for offer</a></p>
                                    <%
                                    } else {
                                    %>
                                <p class="m_5"><%=lt.getProduct_price()%><span>0.000₫</span><a href="#"> click for offer</a></p>
                                <%
                                    }
                                %>
                                <div class="btn_form">
                                    <form>
                                        <input type="submit" value="buy" title="">
                                    </form>
                                </div>
                                <span class="m_link"><a href="#">login to save in wishlist</a></span>
                                <p class="m_text2">
                                <p>CPU: <%=lt.getProduct_CPU()%><p><br>
                                <p>RAM: <%=lt.getProduct_RAM()%></p><br>
                                <p>Đĩa cứng: <%=lt.getProduct_hard_disk()%></p><br>
                                <p>Màn hình rộng: <%=lt.getProduct_screen()%></p><br>
                                <p>Cảm ứng: <%=lt.getProduct_touch()%></p><br>
                                <p>Đồ họa: <%=lt.getProduct_graphic()%></p><br>
                                <p>Đĩa quang: <%=lt.getProduct_optical_disk()%></p><br>
                                <p>Webcam: <%=lt.getProduct_webcam()%></p> MP<br>
                                <p>Chất liệu vỏ: <%=lt.getProduct_material()%></p><br>
                                <p>Cổng giao tiếp: <%=lt.getProduct_gates()%></p><br>
                                <p>Kết nối: <%=lt.getProduct_connection()%></p><br>
                                <p>Pin: <%=lt.getProduct_battery()%></p><br>
                                <p>Trọng lượng: <%=lt.getProduct_weight()%> Kg</p>
                            </div>
                            <div class="clear"></div>	
                            <div class="clients">
                                <h3 class="m_3">Các sản phẩm khác cùng loại</h3>
                                <ul id="flexiselDemo3">
                                    <%
                                        if (lt.getCategory_id() == 1) {
                                            for (Laptop l : laptopDAO.getManyProduct(1)) {
                                    %>
                                    <li><img src="<%="images/" + l.getProduct_name() + " (1)" + ".jpg"%>" /><a href="single.jsp?product_id=<%=l.getProduct_id()%>"><%=l.getProduct_name()%></a></li>
                                        <%
                                            }
                                        } else if (lt.getCategory_id() == 2) {
                                            for (Laptop l : laptopDAO.getManyProduct(2)) {
                                        %>
                                    <li><img src="<%="images/" + l.getProduct_name() + " (1)" + ".jpg"%>" /><a href="single.jsp?product_id=<%=l.getProduct_id()%>"><%=l.getProduct_name()%></a></li>
                                        <%
                                            }
                                        } else if (lt.getCategory_id() == 3) {
                                            for (Laptop l : laptopDAO.getManyProduct(3)) {
                                        %>
                                    <li><img src="<%="images/" + l.getProduct_name() + " (1)" + ".jpg"%>" /><a href="single.jsp?product_id=<%=l.getProduct_id()%>"><%=l.getProduct_name()%></a></li>
                                        <%
                                                }
                                            }
                                        %>
                                </ul>
                                <%
                                } else if (s1.equals("ma")) {
                                    ma = mayanhDAO.getMayanh(product_id);
                                %>
                                <div class="grid images_3_of_2">
                                    <ul id="etalage">
                                        <li>
                                            <a href="optionallink.html">
                                                <img class="etalage_thumb_image" src="<%="images/" + ma.getProduct_name() + ".jpg"%>" class="img-responsive" />
                                                <img class="etalage_source_image" src="<%="images/" + ma.getProduct_name() + ".jpg"%>" class="img-responsive" title="" />
                                            </a>
                                        </li>                                    
                                    </ul>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="desc1 span_3_of_2">
                                    <h3 class="m_3"><%=ma.getProduct_name()%></h3>
                                    <%
                                        if (ma.getCategory_id() == 3) {
                                            double d = ma.getProduct_price() - (ma.getProduct_price() * ma.getProduct_discount() / 100);
                                    %>
                                    <p class="m_5"><font color="red"><%=(double) Math.round((d * 1000) / 1000)%><span>0.000₫ </span></font><span class="reducedfrom"><%=ma.getProduct_price()%><span>0.000₫</span></span> <a href="#">click for offer</a></p>
                                        <%
                                        } else {
                                        %>
                                    <p class="m_5"><%=ma.getProduct_price()%><span>0.000₫</span><a href="#"> click for offer</a></p>
                                    <%
                                        }
                                    %>
                                    <div class="btn_form">
                                        <form>
                                            <input type="submit" value="buy" title="">
                                        </form>
                                    </div>
                                    <span class="m_link"><a href="#">login to save in wishlist</a></span>
                                    <p class="m_text2">
                                    <p>Loại máy ảnh: <%=ma.getProduct_categorize()%><p><br>
                                    <p>Cảm biến: <%=ma.getProduct_sensor()%></p><br>
                                    <p>Bộ xử lý hình ảnh: <%=ma.getProduct_image_processor()%></p><br>
                                    <p>Loại ống kính: <%=ma.getProduct_lens()%></p><br>
                                    <p>Chế độ quay phim: <%=ma.getProduct_film()%></p><br>
                                    <p>Tốc độ chụp hình: <%=ma.getProduct_shutter_speed()%></p><br>
                                    <p>Kết nối: <%=ma.getProduct_connection()%></p><br>
                                    <p>Loại màn hình: <%=ma.getProduct_screen()%></p><br>
                                    <p>Pin: <%=ma.getProduct_battery()%></p><br>
                                    <p>Thẻ nhớ: <%=ma.getProduct_mem_card()%></p><br>
                                    <p>Nơi sản xuất: <%=ma.getProduct_made_in()%></p><br>
                                    <p>Bảo hành: <%=ma.getProduct_warranty()%></p><br>
                                    <p>Trọng lượng: <%=ma.getProduct_weight()%> Kg</p>
                                </div>
                                <div class="clear"></div>	
                                <div class="clients">
                                    <h3 class="m_3">Các sản phẩm khác cùng loại</h3>
                                    <ul id="flexiselDemo3">
                                        <%
                                            if (ma.getCategory_id() == 1) {
                                                for (Mayanh m : mayanhDAO.getManyProduct(1)) {
                                        %>
                                        <li><img src="<%="images/" + m.getProduct_name() + " (1)" + ".jpg"%>" /><a href="single.jsp?product_id=<%=m.getProduct_id()%>"><%=m.getProduct_name()%></a></li>
                                            <%
                                                }
                                            } else if (ma.getCategory_id() == 2) {
                                                for (Mayanh m : mayanhDAO.getManyProduct(2)) {
                                            %>
                                        <li><img src="<%="images/" + m.getProduct_name() + " (1)" + ".jpg"%>" /><a href="single.jsp?product_id=<%=m.getProduct_id()%>"><%=m.getProduct_name()%></a></li>
                                            <%
                                                }
                                            } else if (ma.getCategory_id() == 3) {
                                                for (Mayanh m : mayanhDAO.getManyProduct(3)) {
                                            %>
                                        <li><img src="<%="images/" + m.getProduct_name() + " (1)" + ".jpg"%>" /><a href="single.jsp?product_id=<%=m.getProduct_id()%>"><%=m.getProduct_name()%></a></li>
                                            <%
                                                    }
                                                }
                                            %>
                                    </ul>
                                    <%
                                        }
                                    %>
                                    <script type="text/javascript">
                                        $(window).load(function () {
                                            $("#flexiselDemo1").flexisel();
                                            $("#flexiselDemo2").flexisel({
                                                enableResponsiveBreakpoints: true,
                                                responsiveBreakpoints: {
                                                    portrait: {
                                                        changePoint: 480,
                                                        visibleItems: 1
                                                    },
                                                    landscape: {
                                                        changePoint: 640,
                                                        visibleItems: 2
                                                    },
                                                    tablet: {
                                                        changePoint: 768,
                                                        visibleItems: 3
                                                    }
                                                }
                                            });

                                            $("#flexiselDemo3").flexisel({
                                                visibleItems: 5,
                                                animationSpeed: 1000,
                                                autoPlay: false,
                                                autoPlaySpeed: 3000,
                                                pauseOnHover: true,
                                                enableResponsiveBreakpoints: true,
                                                responsiveBreakpoints: {
                                                    portrait: {
                                                        changePoint: 480,
                                                        visibleItems: 1
                                                    },
                                                    landscape: {
                                                        changePoint: 640,
                                                        visibleItems: 2
                                                    },
                                                    tablet: {
                                                        changePoint: 768,
                                                        visibleItems: 3
                                                    }
                                                }
                                            });

                                        });
                                    </script>
                                    <script type="text/javascript" src="js/jquery.flexisel.js"></script>
                                </div>                        
                                <div class="toogle">
                                    <h3 class="m_3">Product Details</h3>
                                    <p class="m_text">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum.</p>
                                </div>
                                <div class="toogle">
                                    <h3 class="m_3">More Information</h3>
                                    <p class="m_text">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum.</p>
                                </div>
                            </div>
                            <div class="rsingle span_1_of_single">
                                <h5 class="m_1">DANH MỤC</h5>
                                <select class="dropdown" tabindex="8" data-settings='{"wrapperClass":"metro"}'>
                                    <option value="1">ĐIỆN THOẠI</option>                               
                                </select>
                                <select class="dropdown" tabindex="8" data-settings='{"wrapperClass":"metro"}'>
                                    <option value="1">LAPTOP</option>
                                </select>
                                <ul class="kids">
                                    <li><a href="#">MÁY ẢNH</a></li>
                                </ul>
                                <section  class="sky-form">
                                    <h4>GIÁ</h4>
                                    <div class="row row1 scroll-pane">
                                        <div class="col col-4">
                                            <label class="checkbox"><input type="checkbox" name="checkbox" checked=""><i></i>Rs 500 - Rs 700</label>
                                        </div>
                                        <div class="col col-4">
                                            <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Rs 700 - Rs 1000</label>
                                            <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Rs 1000 - Rs 1500</label>
                                            <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Rs 1500 - Rs 2000</label>
                                            <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Rs 2000 - Rs 2500</label>
                                            <label class="checkbox"><input type="checkbox" name="checkbox" ><i></i>Rs 2500 - Rs 3000</label>
                                            <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Rs 3500 - Rs 4000</label>
                                            <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Rs 4000 - Rs 4500</label>
                                            <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Rs 4500 - Rs 5000</label>
                                            <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Rs 5000 - Rs 5500</label>
                                            <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Rs 5500 - Rs 6000</label>
                                            <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Rs 6000 - Rs 6500</label>
                                            <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Rs 6500 - Rs 7000</label>
                                            <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Rs 7000 - Rs 7500</label>
                                            <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Rs 7500 - Rs 8000</label>
                                            <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Rs 8000 - Rs 8500</label>	
                                        </div>
                                    </div>
                                </section>
                                <section  class="sky-form">
                                    <h4>Brand Name</h4>
                                    <div class="row row1 scroll-pane">
                                        <div class="col col-4">
                                            <label class="checkbox"><input type="checkbox" name="checkbox" checked=""><i></i>John Jacobs</label>
                                        </div>
                                        <div class="col col-4">
                                            <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Tag Heuer</label>
                                            <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Lee Cooper</label>
                                            <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Mikli</label>
                                            <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>S Oliver</label>
                                            <label class="checkbox"><input type="checkbox" name="checkbox" ><i></i>Hackett</label>
                                            <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Killer</label>
                                            <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>IDEE</label>
                                            <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Vogue</label>
                                            <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Gunnar</label>
                                            <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Accu Reader</label>
                                            <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>CAT</label>
                                            <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Excellent</label>
                                            <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Feelgood</label>
                                            <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Odysey</label>
                                            <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Animal</label>	
                                        </div>
                                    </div>
                                </section>

                                <section  class="sky-form">
                                    <h4>MÀU SẮC</h4>
                                    <ul class="color-list">
                                        <li><a href="#"> <span class="color1"> </span><p class="red">Red</p></a></li>
                                        <li><a href="#"> <span class="color2"> </span><p class="red">Green</p></a></li>
                                        <li><a href="#"> <span class="color3"> </span><p class="red">Blue</p></a></li>
                                        <li><a href="#"> <span class="color4"> </span><p class="red">Yellow</p></a></li>
                                        <li><a href="#"> <span class="color5"> </span><p class="red">Violet</p></a></li>
                                        <li><a href="#"> <span class="color6"> </span><p class="red">Orange</p></a></li>
                                        <li><a href="#"> <span class="color7"> </span><p class="red">Gray</p></a></li>
                                    </ul>
                                </section>
                                <script src="js/jquery.easydropdown.js"></script>
                            </div>
                            <div class="clear"></div>
                            <div>
                                <div class="fb-comments" data-href="http://localhost:8084/ProjectCopy1/single.jsp?product_id=<%=product_id%>" data-width="850" data-numposts="5"></div>
                            </div>
                        </div>
                        <div class="clear"></div>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp"></jsp:include>

    </body>
</html>
