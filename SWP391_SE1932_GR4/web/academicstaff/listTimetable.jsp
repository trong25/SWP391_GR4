<%--
  Created by IntelliJ IDEA.
  User: datng
  Date: 24-May-24
  Time: 4:56 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
    <head>
        <title>Quản Lý Lớp Học</title>
        <script>
            function submitForm() {
                document.getElementById("myForm").submit();
            }
        </script>
        <style>
            .btn-custom-width {
                width: 120px; /* Adjust the width as needed */
            }
        </style>
        <!-- Custom fonts for this template-->
        <link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

        <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="../css/sb-admin-2.min.css" rel="stylesheet">
        <!-- Custom styles for this page -->
        <link href="../vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
        <script>
            $(document).ready(function () {
                var toastMessage = '<%= request.getAttribute("toastMessage") %>';
                var toastType = '<%= request.getAttribute("toastType") %>';
                if (toastMessage) {
                    if (toastType === 'success') {
                        toastr.success(toastMessage);
                    } else if (toastType === 'error') {
                        toastr.error(toastMessage);
                    }
                }
            });
        </script>
    </head>
    <body>
        <div id="wrapper">
            <jsp:include page="navbar.jsp"/>
            <div id="content-wrapper" class="d-flex flex-column">
                <div id="content">
                    <jsp:include page="../header.jsp"/>
                    <div class="container-fluid">
                        <h1 class="h3 mb-4 text-gray-800 text-center">Danh Sách Thời Khóa Biểu</h1>
                        

                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">Danh Sách Thời Khóa Biểu</h6>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th>Số thứ tự</th>
                                                <th>Tên lớp</th>
                                                <th>Tạo Bởi</th>
                                                <th>Hiệu lực</th>
                                                <th>Trạng thái</th>
                                                <th>Giáo Viên</th>
                                                <th>Ghi chú</th>
                                                <th>Hành động</th>
                                            </tr>


                                        </thead>
                                        <tbody>
                                            <c:forEach var="listTimetable" items="${requestScope.listTimetable}" varStatus="loop">
                                                
                                                    <tr>
                                                        <td>${loop.index + 1}</td>
                                                        <td>${listTimetable.aClass.name}</td>
                                                        <td>${listTimetable.createdBy.lastName} ${listTimetable.createdBy.firstName}</td>
                                                        <td>
                                                            <fmt:formatDate value="${listTimetable.startDate}" pattern="yyyy/MM/dd"/>
                                                            đến
                                                            <fmt:formatDate value="${listTimetable.endDate}" pattern="yyyy/MM/dd"/>
                                                        </td>
                                                        <c:set value="${listTimetable.status}" var="status"/>
                                                        <c:if test="${status eq 'đã được duyệt'}">
                                                            <td><span class="badge badge-success">${status}</span></td>
                                                            </c:if>
                                                            <c:if test="${status eq 'đang chờ xử lý'}">
                                                            <td><span class="badge badge-warning">${status}</span>  </td>
                                                        </c:if>
                                                        <c:if test="${status eq 'không được duyệt'}">
                                                            <td><span class="badge badge-danger">${status}</span>  </td>
                                                        </c:if>
                                                        <td>${listTimetable.teacher.lastName} ${listTimetable.teacher.firstName}</td>
                                                        <td>${listTimetable.note}</td>
                                                        <td>
                                                            <div class="d-flex flex-column align-items-center">
                                                                <a href="view-timetable?classId=${listTimetable.aClass.id}&weekId=${listTimetable.weekId}&status=${listTimetable.status}" class="btn btn-sm btn-primary shadow-sm btn-custom-width">Chi tiết</a>
                                                            </div>
                                                        </td>

                                                    </tr>
                                                
                                            </c:forEach>

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <jsp:include page="../footer.jsp"/>
            </div>
        </div>
        <!-- Page level plugins -->
        <script src="../vendor/datatables/jquery.dataTables.min.js"></script>
        <script src="../vendor/datatables/dataTables.bootstrap4.min.js"></script>

        <!-- Page level custom scripts -->
        <script src="../js/demo/datatables-demo.js"></script>
    </body>
</html>
