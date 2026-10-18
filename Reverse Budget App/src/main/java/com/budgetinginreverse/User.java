package com.budgetinginreverse;

public class User {
    private String username;
    private double monthlyIncome;
    private double monthlyExpenses;
    private String interests;

    public User(String username, double monthlyIncome,
                double monthlyExpenses, String interests) {
        this.username = username;
        this.monthlyIncome = monthlyIncome;
        this.monthlyExpenses = monthlyExpenses;
        this.interests = interests;
    }

    public String getUsername() {
        return username;
    }

    public double getMonthlyIncome() {
        return monthlyIncome;
    }

    public double getMonthlyExpenses() {
        return monthlyExpenses;
    }

    public String getInterests() {
        return interests;
    }
}

