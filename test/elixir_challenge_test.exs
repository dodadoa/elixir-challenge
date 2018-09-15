defmodule ElixirChallengeTest do
  use ExUnit.Case
  doctest ElixirChallenge

  describe "data pipeline" do
    test "should put Red Roof to House's children" do
      data = %{
        0 => [%{id: 10, title: "House", level: 0, children: [], parent_id: nil}],
        1 => [%{id: 12, title: "Red Roof", level: 1, children: [], parent_id: 10}]
      }

      expected = [
        %{
          id: 10,
          title: "House",
          level: 0,
          children: [%{id: 12, title: "Red Roof", level: 1, children: [], parent_id: 10}]
        }
      ]

      assert ElixirChallenge.transform(data) == expected
    end
  end
end
