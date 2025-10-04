defmodule HighSchoolSweetheart do
  def first_letter(name) do 
    name
    |> String.trim()
    |> String.at(0)
  end

  def initial(name) do
    name
    |> first_letter()
    |> String.upcase()
    |> Kernel.<>(".")
  end

  def initials(full_name) do
    full_name
    |> String.split()
    |> Enum.map(fn name ->
      name
      |> first_letter()
      |> initial()
    end)
    |> List.foldl("", fn x, acc -> acc <> x <> " " end)
    |> String.trim()
  end

  def pair(full_name1, full_name2) do
    """
    ❤-------------------❤
    |  #{initials(full_name1)}  +  #{initials(full_name2)}  |
    ❤-------------------❤
    """
  end
  
end
