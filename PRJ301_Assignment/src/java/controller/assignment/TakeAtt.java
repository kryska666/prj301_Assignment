/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.assignment;

import controller.account.BaseRoleController;
import dal.account.AccountDBContext;
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

    @Override
    protected void processPost(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException {

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

    @Override
    protected void processGet(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException {
        int sesid = Integer.parseInt(req.getParameter("id"));
        LecturerDBContext lectDB = new LecturerDBContext();
        AccountDBContext accDB = new AccountDBContext();
        Account acc = (Account) req.getSession().getAttribute("account");
        int lid = accDB.getId(acc.getUsername(),1);;
        Lecturer lect = lectDB.get(lid);
        Session ses = helper.helper.getSessionByID(lect, sesid);
        req.setAttribute("ses", ses);
        req.getRequestDispatcher("../view/lecturer/TakeAtt.jsp").forward(req, resp);
    }
}
