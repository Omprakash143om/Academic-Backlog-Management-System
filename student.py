# endpoints/student.py

from flask import Blueprint, request, jsonify
from config import MYSQL_HOST, MYSQL_USER, MYSQL_PASSWORD, MYSQL_DB
from flask_mysqldb import MySQL

student_bp = Blueprint('student_bp', __name__)

@student_bp.route('/student', methods=['POST'])
def add_student():
    data = request.json
    cursor = mysql.connection.cursor()
    cursor.execute('''
        INSERT INTO students (roll_number, name, email, phone_number, course_id)
        VALUES (%s, %s, %s, %s, %s)
    ''', (data['roll_number'], data['name'], data['email'], data['phone_number'], data['course_id']))
    mysql.connection.commit()
    cursor.close()
    return jsonify({"message": "Student added successfully!"}), 201

@student_bp.route('/students', methods=['GET'])
def get_students():
    cursor = mysql.connection.cursor()
    cursor.execute("SELECT * FROM students")
    students = cursor.fetchall()
    cursor.close()
    return jsonify(students)

@student_bp.route('/student/<roll_number>/backlogs', methods=['GET'])
def get_student_backlogs(roll_number):
    cursor = mysql.connection.cursor()
    cursor.execute('''
        SELECT s.name AS student_name, sub.subject_name, b.status, b.cleared_date
        FROM backlogs b
        JOIN students s ON b.student_id = s.student_id
        JOIN exams e ON b.exam_id = e.exam_id
        JOIN subjects sub ON e.subject_id = sub.subject_id
        WHERE s.roll_number = %s
    ''', (roll_number,))
    backlogs = cursor.fetchall()
    cursor.close()
    return jsonify(backlogs)
