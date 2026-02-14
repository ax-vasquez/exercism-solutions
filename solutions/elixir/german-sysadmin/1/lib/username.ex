defmodule Username do
  def sanitize(username) when username == [], do: []
  def sanitize(username) do
    [head | tail] = username
    case head do
      head when (head >= ?a and head <= ?z) or head == ?_ -> [ head | sanitize(tail) ]
      head when head == ?ä -> ~c"ae" ++ sanitize(tail)
      head when head == ?ö -> ~c"oe" ++ sanitize(tail)
      head when head == ?ü -> ~c"ue" ++ sanitize(tail)
      head when head == ?ß -> ~c"ss" ++ sanitize(tail)
      # Drop the head character if it's not allowed or being replaced
      _ -> sanitize(tail)
    end
  end
end
