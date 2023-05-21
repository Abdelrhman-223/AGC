/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function signUpButton() {
    
    console.log("Button Pressed");
    
    var userName = document.getElementById("userName").value;
    var nationalNumber = document.getElementById("nationalNumber").value;
    var birthDate = document.getElementById("birthDate").value;
    var password = document.getElementById("password").value;
    
    var xhttp = new XMLHttpRequest();
    xhttp.open("POST", "servlet_0_0_1_addEmployeeAjax?userName=" + userName + "&password=" + password + "&nationalNumber=" + nationalNumber + "&birthDate=" + birthDate, true); // to set transation number in the session
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


