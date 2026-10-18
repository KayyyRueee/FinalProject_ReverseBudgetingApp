package com.budgetinginreverse;

public class BudgetPlan {
    private double income;
    private double expenses;
    private double balance;

    public BudgetPlan(double income, double expenses) {
        this.income = income;
        this.expenses = expenses;
        this.balance = income - expenses;
    }

    public double getIncome() {
        return income;
    }

    public double getExpenses() {
        return expenses;
    }

    public double getBalance() {
        return balance;
    }

    public String getRecommendation() {
        if (balance > 0) {
            return "You have money left over after expenses.";
        } else if (balance < 0) {
            return "You need to reduce expenses or increase income.";
        }
        return "Your income exactly covers your expenses.";
    }
}
