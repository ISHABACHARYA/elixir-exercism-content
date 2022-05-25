defmodule BirdCount do
  @moduledoc """
  You're an avid bird watcher that keeps track of how many birds have visited your garden on any given day.
  """
  def today([head | _tail]) do
    head
  end

  def today([]) do
    nil
  end

  def increment_day_count([head | tail]) do
    [head + 1 | tail]
  end

  def increment_day_count([]) do
    [1]
  end

  def has_day_without_birds?([]) do
    false
  end

  def has_day_without_birds?([head | _tail]) when head == 0, do: true

  def has_day_without_birds?([_head | tail]) do
    has_day_without_birds?(tail)
  end

  def total([]), do: 0

  def total([head | tail]) do
    head + total(tail)
  end

  def busy_days([]), do: 0
  def busy_days([head | tail]) when head > 4, do: 1 + busy_days(tail)

  def busy_days([_head | tail]) do
    busy_days(tail)
  end
end
