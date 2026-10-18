
package com.budgetinginreverse;

public class BudgetCal implements BudgetStrategy {

    @Override
    public double calculateBalance(double income, double expenses) {
        return income - expenses;
    }

    public BudgetPlan createPlan(double income, double expenses) {
        return new BudgetPlan(income, expenses);
    }

    public double getRequiredChange(double income, double expenses) {
        return Math.max(0, expenses - income);
    }
}
