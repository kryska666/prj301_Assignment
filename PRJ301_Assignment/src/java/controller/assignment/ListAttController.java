/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.assignment;

import dal.assignment.GroupDBContext;
import dal.assignment.LecturerDBContext;
import helper.helper;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import model.Group;
import model.Lecturer;
import model.Session;
import model.Student;

/**
 *
 * @author admin
 */
public class ListAttController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int gid = 2;
        LecturerDBContext listDB = new LecturerDBContext();
        Group gr = helper.getGroupById(gid, listDB.get(1));
        request.setAttribute("gr", gr);
        ArrayList<Student> stds = gr.getStudents();
        request.setAttribute("stds", stds);
        ArrayList<Session> sess = gr.getSessions();
        request.setAttribute("sess", sess);
        Lecturer lect = gr.getSupervisor();
        request.setAttribute("lect", lect);  
        double numOfSlot = sess.size();
        request.setAttribute("numOfSlot", numOfSlot); 
        request.getRequestDispatcher("../view/lecturer/ListAttandance.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        processRequest(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        processRequest(req, resp);
    }

}
