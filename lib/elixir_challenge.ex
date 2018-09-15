defmodule ElixirChallenge do
  @spec transform(any()) :: any()
  def transform(data) do
    %{ 0 => parent, 1 => child } = data
    new_data = %{ Map.delete(Enum.at(parent, 0), :parent_id) | children: child }
    [new_data]
  end
end
