/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal.assignment;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Attandance;
import model.Group;
import model.Lecturer;
import model.Room;
import model.Session;
import model.Student;
import model.Subject;
import model.TimeSlot;

/**
 *
 * @author admin
 */
public class StudentDBContext extends DBContext<Student> {

    @Override
    public void insert(Student model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Student model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Student model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Student get(int id) {
        try {
            String sql = "SELECT  s.[stdid]\n"
                    + "      ,s.[stdname]\n"
                    + "	  ,g.[gid], g.[gname], g.[lid]\n"
                    + "	  ,ISNULL(a.present,0) present, ISNULL(a.[description],'') [attdescription]\n"
                    + "	  ,ses.sesid,ses.[index],ses.date,ses.attanded\n"
                    + "	  ,sub.subid,sub.subname\n"
                    + "	  ,r.rid,r.rname\n"
                    + "	  ,t.tid,t.[description]\n"
                    + "  FROM [Student] s\n"
                    + "  INNER JOIN [Student_Group] sg ON sg.stdid = s.stdid\n"
                    + "  INNER JOIN [Group] g ON sg.gid = g.gid\n"
                    + "  INNER JOIN [Session] ses ON g.gid = ses.gid\n"
                    + "  INNER JOIN Room r ON r.rid = ses.rid\n"
                    + "  INNER JOIN TimeSlot t ON t.tid = ses.tid\n"
                    + "  INNER JOIN [Subject] sub ON sub.subid = g.subid\n"
                    + "  LEFT JOIN Attandance a ON s.stdid = a.stdid AND ses.sesid = a.sesid\n"
                    + "  WHERE s.stdid=?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            Student std = null;
            Group group = new Group();
            group.setId(-1);
            Session ses = new Session();
            Subject sub = new Subject();
            while (rs.next()) {
                if (std == null) {
                    std = new Student();
                    std.setId(rs.getInt("stdid"));
                    std.setName(rs.getString("stdname"));
                }
                int groupId = rs.getInt("gid");
                if (groupId != 0) {
                    if (groupId != group.getId()) {
                        group = new Group();
                        sub = new Subject();
                        group.setId(rs.getInt("gid"));
                        group.setName(rs.getString("gname"));
                        sub.setId(rs.getInt("subid"));
                        sub.setName(rs.getString("subname"));
                        group.setSubject(sub);
                        std.getGroups().add(group);
                    }

                }
               
                ses = new Session();
                ses.setId(rs.getInt("sesid"));
                ses.setAttandated(rs.getBoolean("attanded"));
                ses.setDate(rs.getDate("date"));
                ses.setIndex(rs.getInt("index"));
                Room r = new Room();
                TimeSlot t = new TimeSlot();
                r.setId(rs.getInt("rid"));
                r.setName(rs.getString("rname"));
                ses.setRoom(r);
                t.setId(rs.getInt("tid"));
                t.setDescription(rs.getString("description"));
                ses.setTimeslot(t);
                ses.setGroup(group);
                group.getSessions().add(ses);

                Attandance a = new Attandance();
                a.setStudent(std);
                a.setSession(ses);
                a.setPresent(rs.getBoolean("present"));
                a.setDescription(rs.getString("attdescription"));
                std.getAttandances().add(a);
                ses.getAttandances().add(a);
            }
            return std;
        } catch (SQLException ex) {
            Logger.getLogger(LecturerDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public ArrayList<Student> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
