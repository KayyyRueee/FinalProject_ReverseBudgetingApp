<%@ page import="com.budgetinginreverse.BudgetPlan" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.nio.charset.StandardCharsets" %>
<%@ page import="java.util.Locale" %>

<%
    String username = (String) request.getAttribute("username");
    BudgetPlan plan = (BudgetPlan) request.getAttribute("plan");

    double hourlyPay = (Double) request.getAttribute("hourlyPay");
    double monthlyGap = (Double) request.getAttribute("monthlyGap");
    double extraHoursPerMonth = (Double) request.getAttribute("extraHoursPerMonth");
    double extraHoursPerWeek = (Double) request.getAttribute("extraHoursPerWeek");
    double scheduledHoursPerWeek = (Double) request.getAttribute("scheduledHoursPerWeek");
    double scheduledHoursPerMonth = (Double) request.getAttribute("scheduledHoursPerMonth");
    double totalHoursPerWeek = (Double) request.getAttribute("totalHoursPerWeek");

    String[] interests = (String[]) request.getAttribute("interests");

    StringBuilder interestQuery = new StringBuilder();

    if (interests != null) {
        for (String interest : interests) {
            if (interestQuery.length() > 0) {
                interestQuery.append("&");
            }

            interestQuery.append("interests=")
                .append(URLEncoder.encode(interest, StandardCharsets.UTF_8));
        }
    }

    String resourceUrl = "resources.jsp";

    if (interestQuery.length() > 0) {
        resourceUrl += "?" + interestQuery;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Budget Results</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            max-width: 800px;
            margin: 30px auto;
            padding: 20px;
            line-height: 1.6;
            background-color: #f5f7fa;
            color: #222;
        }

        .container {
            background-color: white;
            padding: 25px;
            border-radius: 10px;
        }

        h1, h2 {
            color: #245b45;
        }

        .result {
            padding: 15px;
            margin: 15px 0;
            background-color: #edf6f0;
            border-radius: 8px;
        }

        .button {
            display: inline-block;
            padding: 12px 18px;
            margin: 10px 8px 0 0;
            background-color: #245b45;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }

        .button:hover {
            background-color: #17402f;
        }

        .note {
            font-size: 0.95em;
            color: #555;
        }
    </style>
</head>

<body>
<div class="container">

    <h1>Your Budget Results</h1>

    <p>
        Hello, <strong><%= username %></strong>!
        Here is your monthly budget summary.
    </p>

    <div class="result">
        <h2>Monthly Budget Summary</h2>

        <p>
            Monthly Income:
            <strong>$<%= String.format(Locale.US, "%.2f", plan.getIncome()) %></strong>
        </p>

        <p>
            Monthly Expenses:
            <strong>$<%= String.format(Locale.US, "%.2f", plan.getExpenses()) %></strong>
        </p>

        <p>
            Money Remaining:
            <strong>$<%= String.format(Locale.US, "%.2f", plan.getBalance()) %></strong>
        </p>

        <p><%= plan.getRecommendation() %></p>
    </div>

    <h2>Your Work Schedule</h2>

    <p>
        Your current schedule is approximately
        <strong>
            <%= String.format(Locale.US, "%.2f", scheduledHoursPerWeek) %>
            hours per week
        </strong>.
    </p>

    <p>
        That is approximately
        <strong>
            <%= String.format(Locale.US, "%.2f", scheduledHoursPerMonth) %>
            hours per month
        </strong>.
    </p>

    <h2>Extra Hours You May Need</h2>

    <% if (monthlyGap > 0) { %>

        <div class="result">
            <p>
                Your monthly budget has a shortfall of
                <strong>$<%= String.format(Locale.US, "%.2f", monthlyGap) %></strong>.
            </p>

            <p>
                At your current hourly pay of
                <strong>$<%= String.format(Locale.US, "%.2f", hourlyPay) %> per hour</strong>,
                you would need approximately
                <strong>
                    <%= String.format(Locale.US, "%.2f", extraHoursPerMonth) %>
                    extra hours per month
                </strong>,
                or
                <strong>
                    <%= String.format(Locale.US, "%.2f", extraHoursPerWeek) %>
                    extra hours per week
                </strong>.
            </p>

            <p>
                With those extra hours, you would work approximately
                <strong>
                    <%= String.format(Locale.US, "%.2f", totalHoursPerWeek) %>
                    total hours per week
                </strong>.
            </p>
        </div>

        <p class="note">
            These numbers are estimates based on your current hourly pay.
            They do not account for taxes or deductions, and additional shifts
            may not be available. If extra hours are not possible, consider
            reducing expenses or exploring other income opportunities.
        </p>

    <% } else { %>

        <div class="result">
            <p>
                Your listed income currently covers your listed expenses.
                You do not need extra work hours to cover this budget.
            </p>
        </div>

    <% } %>

    <h2>Next Steps</h2>

    <p>
        Explore sample part-time jobs and side gigs that match your interests.
    </p>

    <a class="button" href="<%= resourceUrl %>">
        View Jobs and Side Gigs
    </a>

    <a class="button" href="index.jsp">
        Return to Budget Form
    </a>

</div>
</body>
</html>
