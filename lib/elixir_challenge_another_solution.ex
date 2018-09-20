defmodule ElixirChallengeAnotherSolution do
  defp to_list(data), do: data |> Map.values()

  defp make_children([], _), do: []

  defp make_children([parents | children], id) do
    parents
    |> Enum.filter(&(&1[:parent_id] == id))
    |> Enum.map(fn parent ->
      Map.update!(
        parent,
        :children,
        fn _ -> make_children(children, parent[:id]) end
      )
    end)
  end

  def transform(data) do
    data
    |> to_list
    |> make_children(nil)
  end
end
