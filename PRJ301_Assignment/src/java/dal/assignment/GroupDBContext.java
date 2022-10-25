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
public class GroupDBContext extends DBContext<Group> {

    @Override
    public void insert(Group model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Group model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Group model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Group get(int gid) {
        try {
            String sql = "SELECT g.[gid], g.[gname], g.[lid]\n"
                    + "			,l.lid,l.lname\n"
                    + "			,s.stdid,s.stdname\n"
                    + "			,ISNULL(a.present,0) present, ISNULL(a.[description],'') [description]\n"
                    + "			,ses.sesid,ses.[index],ses.date,ses.attanded\n"
                    + "		  FROM [Group] g\n"
                    + "		  INNER JOIN Lecturer l ON l.lid = g.lid\n"
                    + "		  INNER JOIN [Student_Group] sg ON sg.gid = g.gid \n"
                    + "		  INNER JOIN [Student] s ON s.stdid = sg.stdid \n"
                    + "		  INNER JOIN [Session] ses ON g.gid = ses.gid \n"
                    + "		  LEFT JOIN Attandance a ON s.stdid = a.stdid AND ses.sesid = a.sesid\n"
                    + "		  WHERE g.gid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, gid);
            ResultSet rs = stm.executeQuery();
            Group group = null;
            Student std = new Student();
            std.setId(-1);
            int check = 0;
            while (rs.next()) {
                if (group == null) {
                    group = new Group();
                    Lecturer l = new Lecturer();
                    l.setId(rs.getInt("lid"));
                    l.setName(rs.getString("lname"));
                    group.setSupervisor(l);
                    
                    group.setId(rs.getInt("gid"));
                    group.setName(rs.getString("gname")); 
                }
                int stdId = rs.getInt("stdid");
                if(stdId!=0){
                    if(stdId!=std.getId()){
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
                if(check==1){
                    group.getSessions().add(ses);
                }
                Attandance a = new Attandance();
                a.setStudent(std);
                a.setSession(ses);
                a.setPresent(rs.getBoolean("present"));
                a.setDescription(rs.getString("description"));
                std.getAttandances().add(a);
            }
            return group;
        } catch (SQLException ex) {
            Logger.getLogger(GroupDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public ArrayList<Group> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
