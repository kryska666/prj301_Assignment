/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.assignment;

import dal.assignment.GroupDBContext;
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
        int gid = Integer.parseInt(request.getParameter("gid"));
        GroupDBContext listDB = new GroupDBContext();
        Group gr = listDB.get(gid);
        request.setAttribute("gr", gr);
        ArrayList<Student> stds = listDB.get(gid).getStudents();
        request.setAttribute("stds", stds);
        ArrayList<Session> sess = listDB.get(gid).getSessions();
        request.setAttribute("sess", sess);
        Lecturer lect = listDB.get(gid).getSupervisor();
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
