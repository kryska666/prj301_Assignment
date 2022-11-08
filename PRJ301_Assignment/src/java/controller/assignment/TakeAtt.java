/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.assignment;

import controller.account.BaseRoleController;
import dal.assignment.LecturerDBContext;
import dal.assignment.SessionDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import model.Attandance;
import model.Lecturer;
import model.Session;
import model.Student;
import model.account.Account;

/**
 *
 * @author admin
 */
public class TakeAtt extends BaseRoleController {

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */

    @Override
    protected void processPost(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException {
        int sesid = Integer.parseInt(req.getParameter("id"));
        LecturerDBContext lectDB = new LecturerDBContext();
        Lecturer lect = lectDB.get(1);
        Session ses = helper.helper.getSessionByID(lect, sesid);
        req.setAttribute("ses", ses);
        req.getRequestDispatcher("../view/lecturer/TakeAtt.jsp").forward(req, resp);
    }

    @Override
    protected void processGet(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException {
        Session ses = new Session();
        ses.setId(Integer.parseInt(req.getParameter("sesid")));
        String[] stdids = req.getParameterValues("stdid");
        for (String stdid : stdids) {
            Attandance a = new Attandance();
            Student s = new Student();
            a.setStudent(s);
            a.setDescription(req.getParameter("description" + stdid));
            a.setPresent(req.getParameter("present" + stdid).equals("present"));
            s.setId(Integer.parseInt(stdid));
            ses.getAttandances().add(a);
        }
        SessionDBContext db = new SessionDBContext();
        db.update(ses);
        resp.sendRedirect("takeatt?id=" + ses.getId());
    }
}
