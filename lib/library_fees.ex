defmodule LibraryFees do
  @day_in_second 24 * 60 * 60
  def datetime_from_string(date_time) do
    NaiveDateTime.from_iso8601!(date_time)
  end

  def before_noon?(date_time) do
    time = NaiveDateTime.to_time(date_time)
    submit_time = ~T[12:00:00] |> Time.compare(time)

    case submit_time do
      :gt -> true
      _ -> false
    end
  end

  def return_date(date_time) do
    if(before_noon?(date_time)) do
      NaiveDateTime.add(date_time, @day_in_second * 28) |> NaiveDateTime.to_date()
    else
      NaiveDateTime.add(date_time, @day_in_second * 29) |> NaiveDateTime.to_date()
    end
  end

  def days_late(planned_return_date, actual_return_datetime) do
    late_days = NaiveDateTime.to_date(actual_return_datetime) |> Date.diff(planned_return_date)

    if(late_days < 0) do
      0
    else
      late_days
    end
  end

  def monday?(datetime) do
    # Please implement the monday?/1 function
    NaiveDateTime.to_date(datetime) |> Date.day_of_week() == 1
  end

  def calculate_late_fee(checkout, return, rate) do
    # Please implement the calculate_late_fee/3 function
    return = datetime_from_string(return)
    overDays = datetime_from_string(checkout) |> return_date() |> days_late(return)

    if(monday?(return)) do
      Kernel.floor(overDays * rate * 0.5)
    else
      overDays * rate
    end
  end
end
