package com.budgetinginreverse;

public class Income {
    private double monthlyAmount;
    private double hourlyPay;
    private double hoursPerWeek;

    public Income(double monthlyAmount, double hourlyPay, double hoursPerWeek) {
        this.monthlyAmount = monthlyAmount;
        this.hourlyPay = hourlyPay;
        this.hoursPerWeek = hoursPerWeek;
    }

    public double getMonthlyAmount() {
        if (monthlyAmount > 0) {
            return monthlyAmount;
        }
        return hourlyPay * hoursPerWeek * 4.33;
    }
}
