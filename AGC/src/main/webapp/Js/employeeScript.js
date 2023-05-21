/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function loginButton() {
    var userId = document.getElementById("userId").value;
    var password = document.getElementById("password").value;
    
    xhttp.open("POST", "servlent_0_0_1_employeeLoginAjax?userId=" + userId + "&password=" + password, true); // to set transation number in the session
    xhttp.send();
    
    xhttp.onreadystatechange = function ()
    {
        if (xhttp.readyState === 4 && xhttp.status === 200)
        {
            var data = xhttp.responseText;
            if (data === "Done") {
                alert("Data Saved...!");
                //loadStudentData();
            } else if (data === "NotDone") {
                alert("Error...!");
            }

        }

    };
    
    /*function loadStudentData() {
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
    }*/
}


