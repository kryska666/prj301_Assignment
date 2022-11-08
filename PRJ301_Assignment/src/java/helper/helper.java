/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package helper;

import java.sql.Date;
import java.util.ArrayList;
import model.Group;
import model.Lecturer;
import model.Session;
import model.Student;

/**
 *
 * @author admin
 */
public class helper {

    public static Group getGroupById(int gid, Lecturer lect) {
        Group group = new Group();
        for (Group gr : lect.getGroups()) {
            if (gr.getId() == gid) {
                group.setId(gr.getId());
                group.setName(gr.getName());
                group.setSessions(gr.getSessions());
                group.setStudents(gr.getStudents());
                group.setLectuere(gr.getLectuere());
                group.setSubject(gr.getSubject());
                break;
            }
        }
        return group;
    }

    public static ArrayList<Session> filter(Lecturer lect, java.sql.Date from, java.sql.Date to) {
        ArrayList<Session> sessions = new ArrayList<>();
        for (Session ses : lect.getSessions()) {
            if (util.DateTimeHelper.compare(ses.getDate(), from) >= 0 && util.DateTimeHelper.compare(ses.getDate(), to) <= 0) {
                sessions.add(ses);
            }
        }
        return sessions;
    }

    public static Session getSessionByID(Lecturer lect, int sessionId) {
        for (Session ses : lect.getSessions()) {
            if (ses.getId() == sessionId) {
                return ses;
            }
        }
        return null;
    }

    public static ArrayList<Session> filter(Student std, java.sql.Date from, java.sql.Date to) {
        ArrayList<Session> sessions = new ArrayList<>();
        for (Group gr : std.getGroups()) {
            for (Session ses :gr.getSessions()) {
                if (util.DateTimeHelper.compare(ses.getDate(), from) >= 0 && util.DateTimeHelper.compare(ses.getDate(), to) <= 0) {
                    sessions.add(ses);
                }
            }
        }
        return sessions;
    }

}
