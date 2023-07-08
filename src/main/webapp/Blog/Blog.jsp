<%-- 
    Document   : Blog
    Created on : Jul 4, 2023, 9:13:55 PM
    Author     : devli
--%>
<%
     String baseUrl = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
      <head>
            <title>JSP Page</title>

            <link href="<%=baseUrl%>/BlogStyles.css" rel="stylesheet" type="text/css"/>
      </head>
      
      <body>
                         <jsp:include page="../Components/headerComponent.jsp" /> 
      <section>
            <div class="container">
                <div class="row">
                    <div class="col-md-9 mb40"">
                            <div class="text-center mb-5">
                            <h5 class=" h1 header-title">Blog</h5>
                            <h2 class="display-20 display-md-18 display-lg-16 header-subtitle">Welcome to the Yoga Center Blog</h2>
                            </div>
                    <div class="row">
                        <c:forEach items="${listBlog}" var="blog">
                            <div class="col-lg-6 col-md-6 mb-2-6 mb-4 mt-4">
                                <article class="card card-style2">
                                    <!-- Display the blog image here if available -->
                                    <c:set var="maxContentLength" value="100" />
                                    <c:forEach items="${blog.image}" var="image">
                                        <div class="card-img">
                                            <c:if test="${not empty image.tenAnh and image.tenAnh.equalsIgnoreCase('THUMBNAIL')}">
                                                <img class="rounded-top" src="data:image/jpeg;base64,${image.image}" style="width: 100%; height: 200px; object-fit: cover; object-position: center;" alt="...">
                                            </c:if>
                                        </div>
                                    </c:forEach>
                                    <div class="card-body d-flex flex-column justify-content-between">
                                        <div class="title-container">
                                            <h4 class="blog-title"><a class="blog-title-link" href="<%= baseUrl %>/BLogController?returnID=${blog.getMaBlog()}&action=showDetails">${blog.title}</a></h4>
                                        </div>
                                        <div class="content-container">
                                            <p class="display-30 blog-content">
                                                <c:choose>
                                                    <c:when test="${fn:length(blog.content) > maxContentLength}">
                                                        ${fn:substring(blog.content, 0, maxContentLength)}...
                                                    </c:when>
                                                    <c:otherwise>
                                                        ${blog.content}
                                                    </c:otherwise>
                                                </c:choose>
                                            </p>
                                        </div>
                                        <div class="card-ending">
                                            <div class="btn-more">
                                                <form action="<%=baseUrl%>/BLogController">
                                                    <input type="hidden" name="returnID" value="${blog.getMaBlog()}">
                                                    <input type="hidden" name="action" value="showDetails">
                                                    <button class="custom-btn custom-form-btn">More</button>
                                                </form>
                                            </div>
                                            <div>
                                                <span>Created by : <span class="text-primary">${blog.maHV}</span></span>
                                            </div>
                                        </div>
                                    </div>
                                </article>
                            </div>
                        </c:forEach>
                    </div>

                                                          
                    </div>
                    
                    <div class="col-md-3 mb40">
                        <div class="single category">
                                <h3 class="side-title">Category</h3>                               
                                <ul class="list-unstyled">
                                        <c:forEach items="${listCate}" var="cate" varStatus="status">                                     
                                            <li><a href="<%= baseUrl %>/BLogController?returnID=${cate.maCate}" title="">${cate.tenCate} 
                                                    <span class="pull-right">
                                                        <c:set var="count" value="0" />
                                                        <c:forEach items="${listBlog}" var="blog">
                                                            <c:if test="${blog.maCate eq cate.maCate}">
                                                              <c:set var="count" value="${count + 1}" />
                                                            </c:if>
                                                        </c:forEach>
                                                    ${count}
                                                  </span>
                                                    </span></a></li>
                                        </c:forEach>                               
                                  </ul>
                                    </div>                        
                </div>

            </div>
      </section>
      
      </body>
</html>
