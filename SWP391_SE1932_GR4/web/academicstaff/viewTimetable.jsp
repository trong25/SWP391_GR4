<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Trường Mầm Non BoNo</title>

        <!-- Custom fonts for this template-->
        <link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/information-style.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css">
        <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="../css/sb-admin-2.min.css" rel="stylesheet">
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
        <style>
            #selectWeek {
                width: 80%;
            }

            #selectYear {
                width: 70%;
            }

            .btn-container {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-top: 20px;
            }

            .btn-group-right {
                display: flex;
                gap: 10px;
            }

            .timetable-table {
                width: 100%;
                border-collapse: collapse;
            }

            .timetable-table thead th {
                background-color: #f8f9fc;
                color: #5a5c69;
                font-weight: 700;
                padding: 12px;
                text-align: center;
                border: 1px solid #e3e6f0;
            }

            .timetable-table tbody td {
                padding: 8px;
                text-align: center;
                border: 1px solid #e3e6f0;
            }

            .timetable-table tbody tr:nth-child(even) {
                background-color: #f8f9fc;
            }

            .timetable-table select {
                width: 100%;
                padding: 6px;
                border-radius: 4px;
                border: 1px solid #d1d3e2;
                font-size: 0.875rem;
                color: #858796;
            }
        </style>

    </head>

    <body id="page-top">
        <div id="wrapper">
            <jsp:include page="navbar.jsp"/>

            <!-- Content Wrapper -->
            <div id="content-wrapper" class="d-flex flex-column">
                <div id="content">
                    <jsp:include page="../header.jsp"/>

                    <!-- Begin Page Content -->
                    <div class="container-fluid" style="width: 90%">

                        <div class="app-title">
                            <div>
                                <h3><i class="fa fa-calendar"></i> Chi tiết thời khóa biểu của lớp ${requestScope.aClass.name}</h3></br>
                                <h2 class="row justify-content-center">
                                    Thời khóa biểu
                                </h2>
                                </br>
                                <h5 class="row justify-content-center">
                                    Thời khóa biểu áp dụng từ ngày 
                                    <fmt:formatDate value="${requestScope.week.startDate}" pattern="yyyy/MM/dd"/>
                                    đến ngày 
                                    <fmt:formatDate value="${requestScope.week.endDate}" pattern="yyyy/MM/dd"/>
                                </h5>
                            </div>
                        </div>



                        <form>
                            <table class="timetable-table table table-bordered text-center">
                                <thead>
                                    <tr class="bg-light-gray">
                                        <th class="text-uppercase">Thời gian</th>
                                        <th class="text-uppercase">Thứ hai</th>
                                        <th class="text-uppercase">Thứ ba</th>
                                        <th class="text-uppercase">Thứ tư</th>
                                        <th class="text-uppercase">Thứ năm</th>
                                        <th class="text-uppercase">Thứ sáu</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="timeslot" items="${requestScope.timeslotList}">
                                        <tr>
                                            <td>${timeslot.startTime} - ${timeslot.endTime}</td>
                                            <c:forEach var="day" items="${requestScope.dayList}">
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${not empty requestScope.timetable}">
                                                            <c:forEach var="timetable" items="${requestScope.timetable}">
                                                                <c:if test="${timetable.timeslot.id eq timeslot.id && timetable.day.id eq day.id}">
                                                                    ${timetable.subject.name}
                                                                </c:if>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>
                                                            -
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                            </c:forEach>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>


                            <div class="btn-container">
                                <div class="d-flex justify-content-end">
                                    <p>Ghi chú*: (-) không có dữ liệu</p>
                                </div>
                                <button class="btn btn-danger" type="button" onclick="goBack()">Quay Lại</button>
                            </div>
                        </form>


                    </div>
                    <!-- /.container-fluid -->
                </div>
                <!-- End of Main Content -->

                <jsp:include page="../footer.jsp"/>
            </div>
            <!-- End of Content Wrapper -->

        </div>
        <!-- End of Page Wrapper -->
        <script>
            function goBack() {
                window.history.back();
            }
        </script>
    </body>
</html>
