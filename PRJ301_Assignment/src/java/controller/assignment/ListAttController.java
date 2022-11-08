/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.assignment;

import controller.account.BaseRoleController;
import dal.account.AccountDBContext;
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
import model.account.Account;

/**
 *
 * @author admin
 */
public class ListAttController extends BaseRoleController {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        LecturerDBContext listDB = new LecturerDBContext();
        AccountDBContext accDB = new AccountDBContext();
        Account acc = (Account) request.getSession().getAttribute("account");
        int lectid = accDB.getId(acc.getUsername(),1);
        Lecturer lect = listDB.get(lectid);//thay tham so
        ArrayList<Group> groups = lect.getGroups();
        request.setAttribute("groups", groups);
        String raw_gid = request.getParameter("gid");
        if (raw_gid != null) {
            int gid = Integer.parseInt(raw_gid);
            Group gr = helper.getGroupById(gid, lect);
            request.setAttribute("gr", gr);
            ArrayList<Student> stds = gr.getStudents();
            request.setAttribute("stds", stds);
            ArrayList<Session> sess = gr.getSessions();
            request.setAttribute("sess", sess);
            request.setAttribute("lect", lect);
            boolean istrue = gr.getStudents().get(0).getAttandances().get(0).getSession().isAttandated();
            request.setAttribute("istrue", istrue);
        }

        request.getRequestDispatcher("../view/lecturer/ListAttandance.jsp").forward(request, response);

    }

    @Override
    protected void processPost(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException {
        processRequest(req, resp);
    }

    @Override
    protected void processGet(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException {
        processRequest(req, resp);
    }

}
