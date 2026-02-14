defmodule FreelancerRates do
  def daily_rate(hourly_rate) do
    8.0 * hourly_rate
  end

  def apply_discount(before_discount, discount) do
    percentage = discount / 100
    discount_amount = before_discount * percentage
    before_discount - discount_amount
  end

  def monthly_rate(hourly_rate, discount) do
    monthly_rate = daily_rate(hourly_rate) * 22
    trunc(Float.ceil(apply_discount(monthly_rate, discount)))
  end

  def days_in_budget(budget, hourly_rate, discount) do
    discounted_daily_rate = apply_discount(daily_rate(hourly_rate), discount)
    Float.floor((budget / discounted_daily_rate), 1)
  end
end
