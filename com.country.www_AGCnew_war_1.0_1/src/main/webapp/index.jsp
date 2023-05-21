<%-- 
    Document   : index
    Created on : May 25, 2021, 8:40:26 PM
    Author     : cdc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        student id : <input value="" id="student_id" />
        <br>
        student name : <input value="" id="student_name" />
        <br>
        student age : <input value="" id="student_age" />
        <br>
        <button onclick="addStudent();">Submit</button>

        <br>
        <br>
        <table border="10" style="border: 2px solid black;">
            <thead>
                <tr>
                    <th>Student Id</th>
                    <th>Student Name</th>
                    <th>Student Age</th>
                    <th></th>
                </tr>
            </thead>
            <tbody id="StudentDate">

            </tbody>
        </table>

        <script src="js/jquery.min.js"></script>
        <script>
            function addStudent() {
                var student_id = document.getElementById("student_id").value;
                var student_name = document.getElementById("student_name").value;
                var student_age = document.getElementById("student_age").value;

                var xhttp = new XMLHttpRequest();

                xhttp.open("POST", "addStudentAjax?student_id=" + student_id + "&student_name=" + student_name + "&student_age=" + student_age, true); // to set transation number in the session
                xhttp.send();

                xhttp.onreadystatechange = function ()
                {
                    if (xhttp.readyState === 4 && xhttp.status === 200)
                    {
                        var data = xhttp.responseText;
                        if (data === "Done") {
                            alert("Data Saved...!");
                            loadStudentData();
                        } else if (data === "NotDone") {
                            alert("Error...!");
                        }

                    }

                };
            }


            loadStudentData();
            function loadStudentData() {
                $.ajax({
                    url: "getStudentAjax?",
                    type: 'POST',
                    dataType: 'json',
                    contentType: 'application/json',
                    success: function (data) {
                        //a_0_9_9_9_teachers = JSON.parse(data.toString());
                        document.getElementById("StudentDate").innerHTML = "";
                        for (var i = 0; i < data.length; i++) {
                            document.getElementById("StudentDate").innerHTML += "<tr>"
                                    + "         <td>" + data[i].student_id + "</td>"
                                    + "         <td>" + data[i].student_name + "</td>"
                                    + "         <td>" + data[i].student_age + "</td>"
                                    + "         <td><button onclick=\"deleteStudent('" + data[i].student_id + "');\">Delete</button></td>"
                                    + "</tr>";
                        }
                        if (data.length === 0) {
                            document.getElementById("StudentDate").innerHTML = "<tr><td colspan='3'>No Data Found</td></tr>";
                        }
                    },
                    error: function (xhr, status) {
                        document.getElementById("StudentDate").innerHTML = "<tr><td colspan='3'>No Data Found</td></tr>";
                    }
                });
            }
            
            function deleteStudent(student_id){

                var xhttp = new XMLHttpRequest();

                xhttp.open("POST", "deleteStudentAjax?student_id=" + student_id , true); // to set transation number in the session
                xhttp.send();

                xhttp.onreadystatechange = function ()
                {
                    if (xhttp.readyState === 4 && xhttp.status === 200)
                    {
                        var data = xhttp.responseText;
                        if (data === "Done") {
                            alert("Data Deleted...!");
                            loadStudentData();
                        } else if (data === "NotDone") {
                            alert("Error...!");
                        }

                    }

                };
            }
        </script>
    </body>
</html>
