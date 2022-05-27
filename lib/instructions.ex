defmodule DateParser do
  def day(), do: "(0?[1-9]|[12][0-9]|3[01])"
  def month(), do: "(0?[1-9]|1[0-2])"
  def year(), do: "\\d{4}"

  def day_names() do
    "(Monday|Tuesday|Wednesday|Thursday|Friday|Saturday|Sunday)"
  end

  def month_names() do
    "(January|February|March|April|May|June|July|August|September|October|November|December)"
  end

  def capture_day() do
    "(?<day>#{day()})"
  end

  def capture_month() do
    "(?<month>#{month()})"
  end

  def capture_year() do
    "(?<year>#{year()})"
  end

  def capture_day_name() do
    "(?<day_name>#{day_names()})"
  end

  def capture_month_name() do
    "(?<month_name>#{month_names()})"
  end

  def capture_numeric_date() do
    "#{capture_day()}/#{capture_month()}/#{capture_year()}"
  end

  def capture_month_name_date() do
    "#{capture_month_name()}\\s#{capture_day()},\\s#{capture_year()}"
  end

  def capture_day_month_name_date() do
    "#{capture_day_name()},\\s#{capture_month_name_date()}"
  end

  def match_numeric_date() do
    Regex.compile!("^#{capture_numeric_date()}$")
  end

  def match_month_name_date() do
    Regex.compile!("^#{capture_month_name_date()}$")
  end

  def match_day_month_name_date() do
    Regex.compile!("^#{capture_day_month_name_date()}$")
  end
end
