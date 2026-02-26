defmodule LibraryFees do
  @day_in_seconds 24 * 60 * 60
  @noon ~T[12:00:00]

  def datetime_from_string(string) do
    NaiveDateTime.from_iso8601!(string)
  end

  def before_noon?(datetime) do
    checkout_time = NaiveDateTime.to_time(datetime)
    result = Time.compare(checkout_time, @noon)
    case result do
      result when result == :lt -> true
      _ -> false
    end
  end

  def return_date(checkout_datetime) do
    day_count = if before_noon?(checkout_datetime), do: 28, else: 29
    NaiveDateTime.to_date(NaiveDateTime.add(checkout_datetime, day_count * @day_in_seconds))
  end

  def days_late(planned_return_date, actual_return_datetime) do
    acutal_return_date = NaiveDateTime.to_date(actual_return_datetime)
    diff = Date.diff(planned_return_date, acutal_return_date)
    if diff >= 0 do
      0
    else
      diff * -1
    end
  end

  def monday?(datetime) do
    if Date.day_of_week(NaiveDateTime.to_date(datetime)) == 1, do: true, else: false
  end

  def calculate_late_fee(checkout, return, rate) do
    checkout_datetime = datetime_from_string(checkout)
    return_datetime = datetime_from_string(return)
    target_return_date = return_date(checkout_datetime)
    days = days_late(target_return_date, return_datetime)
    if monday?(return_datetime) == true do
      Float.floor((days * rate) / 2)
    else
      days * rate
    end
  end
end
