/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.student;

import controller.account.BaseRoleController;
import dal.account.AccountDBContext;
import dal.assignment.LecturerDBContext;
import dal.assignment.StudentDBContext;
import dal.assignment.TimeSlotDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import model.Session;
import model.Student;
import model.TimeSlot;
import model.account.Account;
import util.DateTimeHelper;

/**
 *
 * @author admin
 */
public class StdTimetableController extends BaseRoleController {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        AccountDBContext accDB = new AccountDBContext();
        Account acc = (Account) request.getSession().getAttribute("account");
        int stdid = accDB.getId(acc.getUsername(), 2);;
        String raw_from = request.getParameter("from");
        String raw_to = request.getParameter("to");
        java.sql.Date from = null;
        java.sql.Date to = null;
        if (raw_from == null || raw_from.length() == 0) {
            Date today = new Date();
            int todayOfWeek = DateTimeHelper.getDayofWeek(today);
            Date e_from = DateTimeHelper.addDays(today, 2 - todayOfWeek);
            Date e_to = DateTimeHelper.addDays(today, 8 - todayOfWeek);
            from = DateTimeHelper.toDateSql(e_from);
            to = DateTimeHelper.toDateSql(e_to);
        } else {
            from = java.sql.Date.valueOf(raw_from);
            to = java.sql.Date.valueOf(raw_to);
        }

        request.setAttribute("from", from);
        request.setAttribute("to", to);
        request.setAttribute("dates", DateTimeHelper.getDateList(from, to));

        TimeSlotDBContext slotDB = new TimeSlotDBContext();
        ArrayList<TimeSlot> slots = slotDB.list();
        request.setAttribute("slots", slots);
        StudentDBContext stdDB = new StudentDBContext();
        Student student = stdDB.get(stdid);
        ArrayList<Session> sessions = helper.helper.filter(student, from, to);
        request.setAttribute("sessions", sessions);
        request.getRequestDispatcher("../view/student/TimeTable.jsp").forward(request, response);
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
