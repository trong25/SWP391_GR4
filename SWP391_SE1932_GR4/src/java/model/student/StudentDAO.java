/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.student;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.personnel.Personnel;
import model.personnel.PersonnelDAO;
import utils.DBContext;

/**
 *
 * @author MSI
 */
public class StudentDAO extends DBContext {

    private Student createStudent(ResultSet resultSet) throws SQLException {
        try {
            PersonnelDAO personnelDAO = new PersonnelDAO();
            Student student = new Student();
            student.setId(resultSet.getString("id"));
            student.setUserId(resultSet.getString("user_id"));
            student.setFirstName(resultSet.getString("first_name"));
            student.setLastName(resultSet.getString("last_name"));
            student.setAddress(resultSet.getString("address"));
            student.setEmail(resultSet.getString("email"));
            student.setStatus(resultSet.getString("status"));
            student.setBirthday(resultSet.getDate("birthday"));
            student.setGender(resultSet.getBoolean("gender"));
            student.setFirstGuardianName(resultSet.getString("first_guardian_name"));
            student.setFirstGuardianPhoneNumber(resultSet.getString("first_guardian_phone_number"));
            student.setAvatar(resultSet.getString("avatar"));
            student.setSecondGuardianName(resultSet.getString("second_guardian_name"));
            student.setSecondGuardianPhoneNumber(resultSet.getString("second_guardian_phone_number"));
            Personnel personnel = personnelDAO.getPersonnel(resultSet.getString("created_by"));
            student.setCreatedBy(personnel);
            student.setParentSpecialNote(resultSet.getString("parent_special_note"));
            student.setSchoolName(resultSet.getString("School_name"));
            return student;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
     public List<Student> getStudentlByClass(String classId) {
        String sql = "SELECT *\n"
                + "FROM     Class INNER JOIN\n"
                + "                  classDetails ON Class.id = classDetails.class_id INNER JOIN\n"
                + "                  Pupils ON classDetails.pupil_id = Pupils.id INNER JOIN\n"
                + "                  SchoolYears ON Class.school_year_id = SchoolYears.id\n"
                + "\t\t\t\t  where class_id= ?";
        List<Student> listStudent = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, classId);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                PersonnelDAO personnelDAO = new PersonnelDAO();
                Student student = new Student();
                student.setId(resultSet.getString("pupil_id"));
                student.setUserId(resultSet.getString("user_id"));
                student.setFirstName(resultSet.getString("first_name"));
                student.setLastName(resultSet.getString("last_name"));
                student.setAddress(resultSet.getString("address"));
                student.setEmail(resultSet.getString("email"));
                student.setStatus(resultSet.getString("status"));
                student.setBirthday(resultSet.getDate("birthday"));
                student.setGender(resultSet.getBoolean("gender"));
                student.setFirstGuardianName(resultSet.getString("first_guardian_name"));
                student.setFirstGuardianPhoneNumber(resultSet.getString("first_guardian_phone_number"));
                student.setAvatar(resultSet.getString("avatar"));
                student.setSecondGuardianName(resultSet.getString("second_guardian_name"));
                student.setSecondGuardianPhoneNumber(resultSet.getString("second_guardian_phone_number"));
                Personnel personnel = personnelDAO.getPersonnel(resultSet.getString("created_by"));
                student.setCreatedBy(personnel);
                student.setParentSpecialNote(resultSet.getString("parent_special_note"));
                listStudent.add(student);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return listStudent;
    }
      public List<Student> getStudentByStatus(String status) {
        String sql = " Select * from Students where [status] = N'" + status + "' order by id desc";
        List<Student> listStudents = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Student student = new Student();
                student = createStudent(resultSet);
                listStudents.add(student);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return listStudents;
    }
}
