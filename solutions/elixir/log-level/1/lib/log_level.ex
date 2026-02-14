defmodule LogLevel do
  def to_label(level, legacy?) do
    cond do
      level == 0 and not legacy? -> :trace
      level == 1 -> :debug
      level == 2 -> :info
      level == 3 -> :warning
      level == 4 -> :error
      level == 5 and not legacy? -> :fatal
      true -> :unknown
    end
  end

  def alert_recipient(level, legacy?) do
    label = to_label(level, legacy?)
    ops_alert_labels = [:error, :fatal]
    cond do
      label in ops_alert_labels -> :ops
      label in [:unknown] and legacy? -> :dev1
      label in [:unknown] and not legacy? -> :dev2
      true -> false
    end
  end
end
