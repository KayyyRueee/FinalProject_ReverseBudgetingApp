# Budgeting in Reverse

## Project Purpose
The purpose of this project is to help people budget in an unconventional way. Sometimes cutting down expenses isn't always an option. My app takes your hours and pay into consideration to see if maybe making more money is possible. After telling you how many extra hours you need to meet your monthly budget, the user has the option to use the resources page. Which lists available job applications for part-time. If that seems to commintal or is hard to do, it also lists a few side gigs possible based on the user's interests selected at the beginning.

## How to Use It

1. Enter a username.
2. Select at least three interests.
3. Enter monthly income, monthly expenses, hourly pay, and scheduled work hours.
4. Choose whether your work hours are weekly or biweekly.
5. Click **Calculate My Budget** to see the results.
6. Use the resources link to see sample jobs and side gigs.

The results show the difference between income and expenses and estimate extra work hours if more income is needed. The estimate does not include taxes or deductions.

## Main Files

- `index.jsp` – Form where users enter their information.
- `result.jsp` – Shows the budget results.
- `resources.jsp` – Shows job and side gig ideas.
- `BudgetServlet.java` – Receives the form and processes the information.
- `BudgetCal.java` – Handles the budget calculations.
- `BudgetPlan.java` – Stores the budget information and recommendation.
- `BudgetStrategy.java` – Interface for the budget calculation.
- `BudgetType.java` – Enum for budget strategy options.
- `Income.java`, `Expense.java`, and `User.java` – Store information used by the application.
- `pom.xml` – Contains the Maven project setup and dependencies.

## Running the Application

The project uses Java, JSP, Jakarta Servlets, Maven, and Apache Tomcat. Open the project in IntelliJ IDEA, let Maven load the dependencies, build the project, and run it using Tomcat.

During development, the application was accessed at:

`http://localhost:8080/Reverse_Budget_App`

## Troubleshooting

If the application does not open, check that Tomcat is running. If the form does not submit, make sure the number fields contain valid numbers and at least three interests are selected.

The job listings are examples, and the extra work calculations are estimates. Actual income and available work may vary.

