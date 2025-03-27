# endpoints/faculty.py

from flask import Blueprint, request, jsonify

faculty_bp = Blueprint('faculty_bp', __name__)

@faculty_bp.route('/faculty', methods=['POST'])
def add_faculty():
    data = request.json
    cursor = mysql.connection.cursor()
    cursor.execute('''
        INSERT INTO faculty (name, department, email, phone_number, office_location)
        VALUES (%s, %s, %s, %s, %s)
    ''', (data['name'], data['department'], data['email'], data['phone_number'], data['office_location']))
    mysql.connection.commit()
    cursor.close()
    return jsonify({"message": "Faculty member added successfully!"}), 201

@faculty_bp.route('/faculty', methods=['GET'])
def get_faculty():
    cursor = mysql.connection.cursor()
    cursor.execute("SELECT * FROM faculty")
    faculty = cursor.fetchall()
    cursor.close()
    return jsonify(faculty)
