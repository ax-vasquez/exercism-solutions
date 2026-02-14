defmodule HighSchoolSweetheart do
  def first_letter(name) do
    String.first(String.trim(name))
  end

  def initial(name) do
    "#{String.upcase(first_letter(name))}."
  end

  def initials(full_name) do
    names = String.split(String.trim(full_name), " ")
    "#{initial(Enum.at(names, 0))} #{initial(Enum.at(names, 1))}"
  end

  def pair(full_name1, full_name2) do
    """
    ❤-------------------❤
    |  #{initials(full_name1)}  +  #{initials(full_name2)}  |
    ❤-------------------❤
    """
  end
end
