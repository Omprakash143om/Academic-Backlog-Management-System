// JavaScript for Faculty Management
document.addEventListener('DOMContentLoaded', () => {
    fetchFaculties();
    document.getElementById('facultyForm').addEventListener('submit', addFaculty);
});

// Fetch faculties from the server
function fetchFaculties() {
    fetch('/faculties')
        .then(response => response.json())
        .then(data => {
            const tableBody = document.getElementById('facultyTable').querySelector('tbody');
            tableBody.innerHTML = '';
            data.forEach(faculty => {
                const row = document.createElement('tr');
                row.innerHTML = `
                    <td>${faculty.faculty_id}</td>
                    <td>${faculty.name}</td>
                    <td>${faculty.department}</td>
                    <td>${faculty.email}</td>
                    <td>${faculty.phone_number}</td>
                `;
                tableBody.appendChild(row);
            });
        })
        .catch(error => console.error('Error fetching faculties:', error));
}

// Add a new faculty member
function addFaculty(event) {
    event.preventDefault();
    const faculty_id = document.getElementById('faculty_id').value;
    const name = document.getElementById('name').value;
    const department = document.getElementById('department').value;
    const email = document.getElementById('email').value;
    const phone_number = document.getElementById('phone_number').value;

    fetch('/faculty', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ faculty_id, name, department, email, phone_number })
    })
    .then(response => response.json())
    .then(data => {
        console.log(data.message);
        fetchFaculties();
        document.getElementById('facultyForm').reset();
    })
    .catch(error => console.error('Error adding faculty:', error));
}

// JavaScript for Backlog Management
document.addEventListener('DOMContentLoaded', () => {
    fetchBacklogs();
    document.getElementById('backlogForm').addEventListener('submit', addBacklog);
});

// Fetch backlogs from the server
function fetchBacklogs() {
    fetch('/backlogs')
        .then(response => response.json())
        .then(data => {
            const tableBody = document.getElementById('backlogTable').querySelector('tbody');
            tableBody.innerHTML = '';
            data.forEach(backlog => {
                const row = document.createElement('tr');
                row.innerHTML = `
                    <td>${backlog.backlog_id}</td>
                    <td>${backlog.student_roll_number}</td>
                    <td>${backlog.subject_id}</td>
                    <td>${backlog.exam_date}</td>
                    <td>${backlog.status}</td>
                `;
                tableBody.appendChild(row);
            });
        })
        .catch(error => console.error('Error fetching backlogs:', error));
}

// Add a new backlog
function addBacklog(event) {
    event.preventDefault();
    const backlog_id = document.getElementById('backlog_id').value;
    const student_roll_number = document.getElementById('student_roll_number').value;
    const subject_id = document.getElementById('subject_id').value;
    const exam_date = document.getElementById('exam_date').value;
    const status = document.getElementById('status').value;

    fetch('/backlog', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ backlog_id, student_roll_number, subject_id, exam_date, status })
    })
    .then(response => response.json())
    .then(data => {
        console.log(data.message);
        fetchBacklogs();
        document.getElementById('backlogForm').reset();
    })
    .catch(error => console.error('Error adding backlog:', error));
});

// JavaScript for Checking Student Backlogs
document.addEventListener('DOMContentLoaded', () => {
    document.getElementById('studentBacklogForm').addEventListener('submit', checkStudentBacklogs);
});

// Function to check student backlogs
function checkStudentBacklogs(event) {
    event.preventDefault();
    const roll_number = document.getElementById('roll_number').value;

    fetch(`/student/backlogs/${roll_number}`)
        .then(response => response.json())
        .then(data => {
            const tableBody = document.getElementById('studentBacklogTable').querySelector('tbody');
            tableBody.innerHTML = '';
            if (data.length === 0) {
                const row = document.createElement('tr');
                row.innerHTML = '<td colspan="4">No Backlogs Found</td>';
                tableBody.appendChild(row);
            } else {
                data.forEach(backlog => {
                    const row = document.createElement('tr');
                    row.innerHTML = `
                        <td>${backlog.backlog_id}</td>
                        <td>${backlog.subject_id}</td>
                        <td>${backlog.exam_date}</td>
                        <td>${backlog.status}</td>
                    `;
                    tableBody.appendChild(row);
                });
            }
        })
        .catch(error => console.error('Error fetching student backlogs:', error));
});

// JavaScript for Backlog Statistics
document.addEventListener('DOMContentLoaded', () => {
    document.getElementById('getStatsButton').addEventListener('click', getBacklogStats);
});

// Function to get backlog statistics
function getBacklogStats() {
    fetch('/backlog/stats')
        .then(response => response.json())
        .then(stats => {
            document.getElementById('totalStudents').innerText = stats.total_students;
            document.getElementById('studentsWithBacklogs').innerText = stats.backlogs;
        })
        .catch(error => console.error('Error fetching backlog statistics:', error));
});
