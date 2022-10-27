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
import model.Session;
import model.Student;

/**
 *
 * @author admin
 */
public class LecturerDBContext extends DBContext<Lecturer> {

    @Override
    public void insert(Lecturer model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Lecturer model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Lecturer model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Lecturer get(int lid) {
        try {
            String sql = "SELECT    l.lid,l.lname,\n"
                    + "             g.[gid], g.[gname], g.[lid]\n"
                    + "             ,s.stdid,s.stdname\n"
                    + "             ,ISNULL(a.present,0) present, ISNULL(a.[description],'') [description]\n"
                    + "             ,ses.sesid,ses.[index],ses.date,ses.attanded\n"
                    + "             FROM [Group] g\n"
                    + "             INNER JOIN Lecturer l ON l.lid = g.lid\n"
                    + "             INNER JOIN [Student_Group] sg ON sg.gid = g.gid\n"
                    + "             INNER JOIN [Student] s ON s.stdid = sg.stdid \n"
                    + "             INNER JOIN [Session] ses ON g.gid = ses.gid\n"
                    + "             LEFT JOIN Attandance a ON s.stdid = a.stdid AND ses.sesid = a.sesid\n"
                    + "             WHERE l.lid = ? ORDER BY gid ASC, stdid ASC";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, lid);
            ResultSet rs = stm.executeQuery();
            Lecturer l = null;
            Group group = new Group();
            group.setId(-1);
            Student std = new Student();
            std.setId(-1);
            int check = 0;
            while (rs.next()) {
                if(l==null){
                    l = new Lecturer();
                    l.setId(rs.getInt("lid"));
                    l.setName(rs.getString("lname"));
                }
                int groupId = rs.getInt("gid");
                if (groupId != 0) {
                    if (groupId != group.getId()) {
                        group = new Group();
                        group.setSupervisor(l);
                        group.setId(rs.getInt("gid"));
                        group.setName(rs.getString("gname"));
                        l.getGroups().add(group);
                        check = 0;
                    }

                }
                int stdId = rs.getInt("stdid");
                if (stdId != 0) {
                    if (stdId != std.getId()) {
                        std = new Student();
                        std.setId(rs.getInt("stdid"));
                        std.setName(rs.getString("stdname"));
                        group.getStudents().add(std);
                        check++;
                    }
                }
                Session ses = new Session();
                ses.setId(rs.getInt("sesid"));
                ses.setAttandated(rs.getBoolean("attanded"));
                ses.setDate(rs.getDate("date"));
                ses.setIndex(rs.getInt("index"));
                if (check == 1) {
                    group.getSessions().add(ses);
                }
                Attandance a = new Attandance();
                a.setStudent(std);
                a.setSession(ses);
                a.setPresent(rs.getBoolean("present"));
                a.setDescription(rs.getString("description"));
                std.getAttandances().add(a);
            }
            return l;
        } catch (SQLException ex) {
            Logger.getLogger(GroupDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public ArrayList<Lecturer> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
