<%-- 
    Document   : BlogDetails
    Created on : Jul 4, 2023, 9:14:03 PM
    Author     : devli
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String baseUrl = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="com.mycompany.yogacenterproject.dao.BlogDAO" %>

<!DOCTYPE html>
<html>
    <head>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/js/bootstrap.bundle.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>       
        <link href="<%=baseUrl%>/BlogDetail.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <jsp:include page="../Components/headerComponent.jsp" /> 
        <div class="blog-single gray-bg">
            <div class="container">
                <div class="row align-items-start">
                    <div class="col-lg-8 m-15px-tb">
                        <article class="article">
                            <div class="article-img">
                                <img src="data:image/jpeg;base64,${blogImgDetails.image}" style="width: 100%; object-fit: cover"title alt>
                            </div>
                            <div class="article-title">
                                <h2 class="">${blogDetails.title}</h2>
                                <div class="media">
                                    <div class="avatar">
                                        <img src="https://img.freepik.com/free-vector/man-meditating-with-flat-design_23-2147855145.jpg?w=826&t=st=1688749455~exp=1688750055~hmac=48facc0881188275dd2ef67632298bb734903e78636e4623d90d4437e01eaf74" title alt>
                                    </div>
                                    <div class="media-body">
                                        <c:if  test="${blogDetails.hocVienDTO.username!=null}">
                                            <label>${blogDetails.hocVienDTO.username}</label>
                                        </c:if>
                                        <c:if  test="${blogDetails.trainerDTO!=null}">
                                            <label>${blogDetails.trainerDTO.username}</label>

                                        </c:if>
                                        <span>${blogDetails.date}</span>
                                    </div>
                                </div>
                            </div>
                            <div class="article-content">
                                <span style="color:#545554; font-size: 20px" class="blogContent">${blogDetails.content}</span>
                            </div>
                            <!--        <div class="nav tag-cloud">
                                    <a href="#">Design</a>
                                    <a href="#">Development</a>
                                    <a href="#">Travel</a>
                                    <a href="#">Web Design</a>
                                    <a href="#">Marketing</a>
                                    <a href="#">Research</a>
                                    <a href="#">Managment</a>
                                    </div>-->
                        </article>

                        <section class="content-item" id="comments">
                            <div class="container">   
                                <div class="row">
                                    <div class="col-sm-8">   

                                        <c:if test = "${sessionScope.hocVienDTO != null || sessionScope.trainerDTO != null}">
                                            <div class="comment mt-4 text-justify float-left" style="border: none">
                                                <form action="<%=baseUrl%>/CommentController">
                                                    <div class="d-flex flex-row align-items-start"><textarea class="form-control ml-1 shadow-none textarea" name="comment"></textarea></div>
                                                    <div class="mt-2 text-right"><button class="btn btn-primary btn-sm shadow-none" type="submit">Post comment</button><button class="btn btn-outline-primary btn-sm ml-1 shadow-none" type="button">Cancel</button></div>

                                                    <input type="hidden" name="returnID" value="${blogDetails.maBlog}" />
                                                    <input type="hidden" name="action" value="postBlog" />



                                                </form>
                                            </div>
                                        </c:if>

                                        <h3>Comments</h3>
                                        <c:forEach var="commentDTO" items="${requestScope.listComment}">
                                            <div class="comment mt-4 text-justify float-left">
                                                <c:if test="${sessionScope.hocVienDTO.maHV ==commentDTO.hocVienDTO.maHV }">
                                                    <form action="<%=baseUrl%>/CommentController">
                                                        <button class="btn btn-primary btn-sm shadow-none" type="submit" style="margin-left: 595px;size: 100px">Delete</button>
                                                        <input type="hidden" name="maComment" value="${commentDTO.maComment}" />
                                                        <input type="hidden" name="returnID" value="${blogDetails.maBlog}" />
                                                        <input type="hidden" name="action" value="deleteBlog" />
                                                    </form>
                                                </c:if>
                                                <img src="https://i.imgur.com/yTFUilP.jpg" alt="" class="rounded-circle" width="40" height="40">
                                                <c:if test="${commentDTO.hocVienDTO.username!=null}">
                                                    <h2>${commentDTO.hocVienDTO.username}</h2>
                                                </c:if>
                                                <c:if test="${commentDTO.trainerDTO.username!=null}">
                                                    <h2>${commentDTO.trainerDTO.ten}<bold style="color: greenyellow; font-size: 20px">(Trainer)</bold></h2>
                                                        </c:if>
                                                <span>- ${commentDTO.date}</span>
                                                <br>
                                                <p>${commentDTO.noiDung}</p>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </section>                            

                    </div>


                    <div class="col-lg-4 m-15px-tb blog-aside">
                        <div class="widget widget-latest-post">
                            <div class="widget-title">
                                <h3>Latest Post</h3>
                            </div>
                            <div class="widget-body">
                                <c:forEach items="${requestScope.blogLatest}" var="blog">
                                    <div class="latest-post-aside media">
                                        <div class="lpa-left media-body">
                                            <div class="lpa-title">
                                                <h5><a href="<%= baseUrl%>/BLogController?returnID=${blog.getMaBlog()}&action=showDetails">${blog.getTitle()}</a></h5>
                                            </div>
                                            <div class="lpa-meta">
                                                <a class="name" href="#">
                                                    ${blog.maHV}
                                                </a>
                                                <a class="date" href="#">
                                                    ${blog.date}
                                                </a>
                                            </div>
                                        </div>
                                        <div class="lpa-right">
                                            <a href="#">

                                                <img src="data:image/jpeg;base64,${BlogImageDAO.getImageByBlogID(blog.getMaBlog())}" title alt>
                                            </a>
                                        </div>
                                    </div>
                                </c:forEach>            

                            </div>
                        </div>


                        <div class="widget widget-tags">
                            <div class="widget-title">
                                <h3>Category</h3>
                            </div>  
                            <div class="single-category">
                                <ul class="list-unstyled">
                                    <c:forEach items="${blogCate}" var="cate" varStatus="status">                                     
                                        <li><a href="<%=baseUrl%>/BLogController?returnID=${cate.maCate}&action=showBlogCategory" " title="">${cate.tenCate} 
                                            </c:forEach>                               
                                </ul>
                            </div>
                        </div>

                    </div>
                </div>

            </div>



        </div>

    </body>

    <style>
        #comments form {
            margin-bottom: -29px;
        }
        .comments{
            margin-top: 5%;
            margin-left: 20px;
        }



        .comment{
            width: 700px;
            border: 1px solid rgba(16, 46, 46, 1);
            font-size: 20px;
            float: left;
            border-radius: 5px;
            padding-left: 40px;
            padding-right: 30px;
            padding-top: 15px;

        }
        .comment h2,.comment span,.darker h4,.darker span{
            display: inline;
        }

        .comment p,.comment span,.darker p,.darker span{

        }
    </style>

    <style>
        .single-category li{
            padding: 10px;
        }
        .single-category a{
            text-decoration: none;
            color: black;

        }
        .single-category a:hover{
            color: #ff0000;

        }
    </style>
</html>