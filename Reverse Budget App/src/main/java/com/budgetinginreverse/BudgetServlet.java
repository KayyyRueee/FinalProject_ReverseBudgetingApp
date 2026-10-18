package com.budgetinginreverse;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.List;

@WebServlet("/budget")
public class BudgetServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        String username = request.getParameter("username");
        String incomeText = request.getParameter("income");
        String expensesText = request.getParameter("expenses");
        String hourlyPayText = request.getParameter("hourlyPay");
        String scheduledHoursText = request.getParameter("scheduledHours");
        String workSchedule = request.getParameter("workSchedule");
        String[] selectedInterests = request.getParameterValues("interests");

        try {
            double income = Double.parseDouble(incomeText.trim());
            double expenses = Double.parseDouble(expensesText.trim());
            double hourlyPay = Double.parseDouble(hourlyPayText.trim());
            double scheduledHours = Double.parseDouble(scheduledHoursText.trim());

            if (username == null || username.isBlank()
                    || income < 0 || expenses < 0 || hourlyPay <= 0
                    || scheduledHours < 0
                    || !Double.isFinite(income)
                    || !Double.isFinite(expenses)
                    || !Double.isFinite(hourlyPay)
                    || !Double.isFinite(scheduledHours)
                    || selectedInterests == null
                    || selectedInterests.length < 3
                    || (!"weekly".equals(workSchedule)
                    && !"biweekly".equals(workSchedule))) {
                throw new IllegalArgumentException();
            }

            List<String> allowedInterests = Arrays.asList(
                    "pets", "art", "teaching", "babysitting",
                    "handiwork", "yardwork", "driving"
            );

            for (String interest : selectedInterests) {
                if (!allowedInterests.contains(interest)) {
                    throw new IllegalArgumentException();
                }
            }

            double scheduledHoursPerWeek;

            if ("biweekly".equals(workSchedule)) {
                scheduledHoursPerWeek = scheduledHours / 2.0;
            } else {
                scheduledHoursPerWeek = scheduledHours;
            }

            double scheduledHoursPerMonth = scheduledHoursPerWeek * 4.33;
            double monthlyGap = Math.max(0, expenses - income);
            double extraHoursPerMonth = monthlyGap / hourlyPay;
            double extraHoursPerWeek = extraHoursPerMonth / 4.33;
            double totalHoursPerWeek =
                    scheduledHoursPerWeek + extraHoursPerWeek;

            BudgetCal calculator = new BudgetCal();
            BudgetPlan plan = calculator.createPlan(income, expenses);

            request.setAttribute("username", username);
            request.setAttribute("plan", plan);
            request.setAttribute("hourlyPay", hourlyPay);
            request.setAttribute("monthlyGap", monthlyGap);
            request.setAttribute("extraHoursPerMonth", extraHoursPerMonth);
            request.setAttribute("extraHoursPerWeek", extraHoursPerWeek);
            request.setAttribute("scheduledHoursPerWeek", scheduledHoursPerWeek);
            request.setAttribute("scheduledHoursPerMonth", scheduledHoursPerMonth);
            request.setAttribute("totalHoursPerWeek", totalHoursPerWeek);
            request.setAttribute("interests", selectedInterests);

            request.getRequestDispatcher("/result.jsp")
                    .forward(request, response);

        } catch (IllegalArgumentException e) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);

            try (PrintWriter out = response.getWriter()) {
                out.println("<!DOCTYPE html><html><body>");
                out.println("<h2>Invalid information</h2>");
                out.println("<p>Please enter numbers for income, expenses, "
                        + "hourly pay, and scheduled hours. "
                        + "Select at least three interests.</p>");
                out.println("<a href='index.jsp'>Return to the form</a>");
                out.println("</body></html>");
            }
        }
    }
}
