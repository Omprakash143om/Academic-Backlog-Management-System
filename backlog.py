# endpoints/backlog.py

from flask import Blueprint, request, jsonify

backlog_bp = Blueprint('backlog_bp', __name__)

@backlog_bp.route('/backlog/<int:backlog_id>', methods=['PUT'])
def update_backlog(backlog_id):
    data = request.json
    cursor = mysql.connection.cursor()
    cursor.execute('''
        UPDATE backlogs SET status = %s, cleared_date = %s WHERE backlog_id = %s
    ''', (data['status'], data['cleared_date'], backlog_id))
    mysql.connection.commit()
    cursor.close()
    return jsonify({"message": "Backlog status updated successfully!"})
