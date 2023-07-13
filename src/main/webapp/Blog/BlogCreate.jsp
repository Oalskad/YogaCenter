<%-- 
    Document   : CreateClassTypePage
    Created on : Jun 9, 2023, 1:15:35 PM
    Author     : Oalskad
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
        %>

        <link href="BlogCreateStyle.css" rel="stylesheet" type="text/css"/>
        <link href="<%=url%>/Blog/BlogCreateStyle.css" rel="stylesheet" type="text/css"/>

    </head>
    <body>

        <%@include  file="../Components/headerComponent.jsp" %>

        <!--AlertMessage-->                                       
        <div id="alertMessage" class="alert-message">
            Vui lòng điền đầy đủ thông tin
            <div id="progressBar" class="progress-bar"></div>
        </div>

        <div class="container">
            <div class="row align-items-start">
                <div class="col-lg-8 m-15px-tb">
                    <form action="<%=url%>/BLogController" method="post" enctype="multipart/form-data">                            
                        <article class="article">

                            <div style="height:250px"id="previewThumb" class="previewThumb">

                            </div>
                            <div class="image-input">
                                <input class="input-style"  type="file" id="fileInput" name="Banner" onchange="addThumbnailImage(this)">                
                            </div>


                            <div class="Controller">

                                <input type="hidden" id="Thumbnails" name="Banner"  >
                                <div class="blog">
                                    <div class="textarea-container">
                                        <div class="input-title">
                                            <textarea   class="input-style " id="titleInput" style="text-align: center; width: 100%; margin: 20px 0px; height: 50px"type="text" class="title" name="title" placeholder="Blog title"></textarea>                                                      
                                        </div>
                                        <div>
                                            <textarea   class="input-style" id="contentInput" style="height: 300px; width: 100%" type="text" class="article" name="content" placeholder="Start writing here..."></textarea>                                                          
                                        </div>
                                    </div>
                                    <div class="button-in-blog">
                                        <button class="button-blog-cancel"> 
                                            Cancel
                                        </button>
                                        <button class="button-blog" id="submitButton">
                                            <input type="hidden" name="action" value="CreateBlog">
                                            Submit
                                        </button>                                                           
                                    </div>

                                </div>
                            </div>

                        </article>
                    </form>


                </div>

            </div>

        </div>     


        <style></style>
    </body>
    <script src="<%=url%>/js/CreateBlogStyle.js"></script>
</html>