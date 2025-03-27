from flask import Flask, render_template

app = Flask(__name__)

# Route to Home Page
@app.route('/')
def index():
    return render_template('index.html')

# Route to Manage Students Page
@app.route('/manage_students')
def manage_students():
    return render_template('students.html')

# Route to Manage Faculty Page
@app.route('/manage_faculty')
def manage_faculty():
    return render_template('faculty.html')

# Route to Manage Backlogs Page
@app.route('/manage_backlogs')
def manage_backlogs():
    return render_template('backlogs.html')

# Route to Check Student Backlogs Page
@app.route('/check_student_backlogs')
def check_student_backlogs():
    return render_template('student_backlog.html')

# Route to View Backlog Statistics Page
@app.route('/view_backlog_stats')
def view_backlog_stats():
    return render_template('backlog_stats.html')

if __name__ == '__main__':
    app.run(debug=True)
