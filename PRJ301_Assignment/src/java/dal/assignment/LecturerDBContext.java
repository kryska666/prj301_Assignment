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
        ArrayList<Session> sessions = new ArrayList<>();
        try {
            String sql = "SELECT l.lid,l.lname,\n"
                    + "				g.[gid], g.[gname], g.[lid]\n"
                    + "                    	,s.stdid,s.stdname\n"
                    + "                   	,ISNULL(a.present,0) present, ISNULL(a.[description],'') [attdescription]\n"
                    + "                    	,ses.sesid,ses.[index],ses.date,ses.attanded\n"
                    + "				,sub.subid,sub.subname\n"
                    + "				,r.rid,r.rname\n"
                    + "				,t.tid,t.[description]\n"
                    + "                    	FROM [Group] g\n"
                    + "                   	INNER JOIN Lecturer l ON l.lid = g.lid\n"
                    + "				INNER JOIN [Subject] sub ON sub.subid = g.subid\n"
                    + "                   	INNER JOIN [Student_Group] sg ON sg.gid = g.gid\n"
                    + "                   	INNER JOIN [Student] s ON s.stdid = sg.stdid \n"
                    + "				INNER JOIN [Session] ses ON g.gid = ses.gid\n"
                    + "				INNER JOIN Room r ON r.rid = ses.rid\n"
                    + "				INNER JOIN TimeSlot t ON t.tid = ses.tid\n"
                    + "                   	LEFT JOIN Attandance a ON s.stdid = a.stdid AND ses.sesid = a.sesid\n"
                    + "				WHERE l.lid=?\n"
                    + "				ORDER BY gid ASC, stdid ASC";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, lid);
            ResultSet rs = stm.executeQuery();
            Lecturer l = null;
            Group group = new Group();
            group.setId(-1);
            Student std = new Student();
            std.setId(-1);
            Session ses = new Session();
            Subject sub = new Subject();
            int check = 0;
            while (rs.next()) {
                if (l == null) {
                    l = new Lecturer();
                    l.setId(rs.getInt("lid"));
                    l.setName(rs.getString("lname"));
                }
                int groupId = rs.getInt("gid");
                if (groupId != 0) {
                    if (groupId != group.getId()) {
                        group = new Group();
                        sub = new Subject();
                        group.setLectuere(l);
                        group.setId(rs.getInt("gid"));
                        group.setName(rs.getString("gname"));
                        sub.setId(rs.getInt("subid"));
                        sub.setName(rs.getString("subname"));
                        group.setSubject(sub);
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

                if (check == 1) {
                    group.getSessions().add(ses);
                    l.getSessions().add(ses);
                    sessions.add(ses);
                }
                Attandance a = new Attandance();
                a.setStudent(std);
                a.setSession(ses);
                a.setPresent(rs.getBoolean("present"));
                a.setDescription(rs.getString("attdescription"));
                std.getAttandances().add(a);
                for(Session session : sessions){
                    if(session.getId() == ses.getId()){
                        session.getAttandances().add(a);
                    }
                }
            }
            return l;
        } catch (SQLException ex) {
            Logger.getLogger(LecturerDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public ArrayList<Lecturer> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
