defmodule Username do
  def sanitize([]), do: []
  def sanitize([letter | rest]) do
    # ä becomes ae
    # ö becomes oe
    # ü becomes ue
    # ß becomes ss
    case letter do
       letter when letter >= ?a and letter <= ?z -> [letter] ++ sanitize(rest)
       ?_ -> [?_ | sanitize(rest)]
       ?ä -> ~c"ae" ++ sanitize(rest)
       ?ö -> ~c"oe" ++ sanitize(rest)
       ?ü -> ~c"ue" ++ sanitize(rest)
       ?ß -> ~c"ss" ++ sanitize(rest)
       _ -> sanitize(rest)
    end
  end
end