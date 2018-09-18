defmodule ElixirChallenge do
  defp getAllChildrenByParentId(children, parentId) do
    Enum.filter(children, fn child ->
      Map.get(child, :parent_id) == parentId
    end)
  end

  defp putChildrenToParent(children, parent) do
    Map.update(
      parent,
      :children,
      [],
      fn _ -> getAllChildrenByParentId(children, Map.get(parent, :id)) end
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
          Enum.map(parents, fn parent -> putChildrenToParent(children, parent) end)
        end
      end
    )
  end
end
