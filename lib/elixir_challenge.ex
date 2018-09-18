defmodule ElixirChallenge do
  def transform(data) do
    data
    |> Map.to_list()
    |> Enum.reverse()
    |> Enum.reduce(
      [],
      fn {_, listOfElement}, accumulator ->
        if accumulator == [] do
          accumulator ++ listOfElement
        else
          listOfElement
          |> Enum.map(fn parent ->
            parent
            |> update_in([:children], fn listOfParents ->
              listOfParents ++
                Enum.filter(accumulator, fn children ->
                  Map.get(children, :parent_id) == Map.get(parent, :id)
                end)
            end)
          end)
        end
      end
    )
  end
end
