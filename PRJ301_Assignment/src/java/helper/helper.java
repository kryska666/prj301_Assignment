/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package helper;

import java.util.ArrayList;
import model.Group;
import model.Lecturer;

/**
 *
 * @author admin
 */
public class helper {
    public static Group getGroupById(int gid,Lecturer lect){
        Group group = new Group();
        ArrayList<Group> groups = lect.getGroups();
        for(Group gr : groups){
            if(gr.getId() == gid){
                group.setId(gr.getId());
                group.setName(gr.getName());
                group.setSessions(gr.getSessions());
                group.setStudents(gr.getStudents());
                group.setSupervisor(gr.getSupervisor());
                group.setSubject(gr.getSubject());
                break;
            }
        }
        return group;
    }
}
