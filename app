<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Student Management System</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background: #f5f6fa;
      margin: 0;
      padding: 20px;
    }
    h1 {
      text-align: center;
      color: #2f3640;
    }
    .container {
      max-width: 600px;
      background: white;
      margin: 20px auto;
      padding: 20px;
      border-radius: 12px;
      box-shadow: 0 0 10px rgba(0,0,0,0.1);
    }
    input {
      width: 100%;
      padding: 8px;
      margin: 8px 0;
      border: 1px solid #ccc;
      border-radius: 6px;
    }
    button {
      background: #0984e3;
      color: white;
      border: none;
      padding: 10px 15px;
      border-radius: 6px;
      cursor: pointer;
    }
    button:hover {
      background: #74b9ff;
    }
    table {
      width: 100%;
      margin-top: 15px;
      border-collapse: collapse;
    }
    th, td {
      border: 1px solid #ddd;
      padding: 10px;
      text-align: center;
    }
    th {
      background: #74b9ff;
      color: white;
    }
  </style>
</head>
<body>
  <h1>🎓 Student Management System</h1>
  <div class="container">
    <input type="text" id="name" placeholder="Enter Student Name">
    <input type="text" id="roll" placeholder="Enter Roll Number">
    <input type="number" id="marks" placeholder="Enter Marks">
    <button onclick="addStudent()">Add Student</button>
    <button onclick="clearStudents()">Clear All</button>

    <table id="studentTable">
      <thead>
        <tr>
          <th>Name</th>
          <th>Roll</th>
          <th>Marks</th>
          <th>Action</th>
        </tr>
      </thead>
      <tbody></tbody>
    </table>
  </div>

  <script>
    let students = [];

    function addStudent() {
      const name = document.getElementById('name').value.trim();
      const roll = document.getElementById('roll').value.trim();
      const marks = document.getElementById('marks').value.trim();

      if (name === "" || roll === "" || marks === "") {
        alert("⚠ Please fill all fields!");
        return;
      }

      students.push({ name, roll, marks });
      document.getElementById('name').value = "";
      document.getElementById('roll').value = "";
      document.getElementById('marks').value = "";
      showStudents();
    }

    function showStudents() {
      const tbody = document.querySelector("#studentTable tbody");
      tbody.innerHTML = "";
      students.forEach((s, index) => {
        const row = `<tr>
          <td>${s.name}</td>
          <td>${s.roll}</td>
          <td>${s.marks}</td>
          <td><button onclick="deleteStudent(${index})">❌ Delete</button></td>
        </tr>`;
        tbody.innerHTML += row;
      });
    }

    function deleteStudent(index) {
      students.splice(index, 1);
      showStudents();
    }

    function clearStudents() {
      students = [];
      showStudents();
    }
  </script>
</body>
</html>
