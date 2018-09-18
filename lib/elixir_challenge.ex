defmodule ElixirChallenge do
  defp get_all_children_by_parent_id(children, parent_id) do
    Enum.filter(children, fn child ->
      child[:parent_id] == parent_id
    end)
  end

  defp put_children_to_parent(children, parent) do
    Map.update(
      parent,
      :children,
      [],
      fn _ -> get_all_children_by_parent_id(children, Map.get(parent, :id)) end
    )
  end

  def transform(data) do
    data
    |> Map.to_list()
    |> Enum.reverse()
    |> Enum.reduce(
      [],
      fn {_level, parents}, children ->
        if children == [] do
          parents
        else
          Enum.map(parents, fn parent -> put_children_to_parent(children, parent) end)
        end
      end
    )
  end
end
