defmodule LogLevelTests do
  use ExUnit.Case
  doctest LogLevel

  test "code conversion to lable handling legacy systems" do
    assert LogLevel.to_label(0, true) == :unknown
    assert LogLevel.to_label(0, false) == :trace
  end

  test "send alert to respective teams" do
    assert LogLevel.alert_recipient(-1, true) == :dev1
    assert LogLevel.alert_recipient(0, false) == false
  end
end
