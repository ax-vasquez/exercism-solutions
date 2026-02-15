defmodule NameBadge do
  def print(id, name, department) do
    id_str = if id == nil, do: "", else: "[#{id}] - "
    dept_str = if department == nil, do: "OWNER", else: String.upcase(department)
    id_str <> "#{name} - " <> dept_str
  end
end
