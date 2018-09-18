defmodule ElixirChallenge do
  defp getAllChildrenByParentId(parentId, childrens) do
    Enum.filter(childrens, fn children ->
      Map.get(children, :parent_id) == parentId
    end)
  end

  def transform(data) do
    data
    |> Map.to_list()
    |> Enum.reverse()
    |> Enum.reduce(
      [],
      fn {_level, parents}, childrens ->
        if childrens == [] do
          parents
        else
          parents
          |> Enum.map(fn parent ->
            parent
            |> update_in(
              [:children],
              fn _ ->
                getAllChildrenByParentId(Map.get(parent, :id), childrens)
              end
            )
          end)
        end
      end
    )
  end
end
