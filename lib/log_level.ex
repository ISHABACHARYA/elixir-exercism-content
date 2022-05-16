defmodule LogLevel do
  @moduledoc """
  The system handles aggregating multiple logs having multiple apps some legacy app doesn't support some logs
  """
  @log_codes %{0 => :trace, 1 => :debug, 2 => :info, 3 => :warning, 4 => :error, 5 => :fatal}

  def to_label(code, legacy_app?) do
    cond do
      code == 0 && !legacy_app? -> @log_codes[code]
      code == 1 -> @log_codes[code]
      code == 2 -> @log_codes[code]
      code == 3 -> @log_codes[code]
      code == 4 -> @log_codes[code]
      code == 5 && !legacy_app? -> @log_codes[code]
      true -> :unknown
    end
  end

  def alert_recipient(code, legacy_app?) do
    label = to_label(code, legacy_app?)

    cond do
      label == :error || label == :fatal ->
        :ops

      label == :unknown && legacy_app? ->
        :dev1

      label == :unknown ->
        :dev2

      true ->
        false
    end
  end
end
