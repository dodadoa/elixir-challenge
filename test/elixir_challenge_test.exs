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
          parent_id: nil,
          children: [%{id: 12, title: "Red Roof", level: 1, children: [], parent_id: 10}]
        }
      ]

      assert ElixirChallenge.transform(data) == expected
    end

    test "should put Red Roof and Blue Roof to House's children" do
      data = %{
        0 => [%{id: 10, title: "House", level: 0, children: [], parent_id: nil}],
        1 => [
          %{id: 12, title: "Red Roof", level: 1, children: [], parent_id: 10},
          %{id: 18, title: "Blue Roof", level: 1, children: [], parent_id: 10}
        ]
      }

      expected = [
        %{
          id: 10,
          title: "House",
          level: 0,
          parent_id: nil,
          children: [
            %{id: 12, title: "Red Roof", level: 1, children: [], parent_id: 10},
            %{id: 18, title: "Blue Roof", level: 1, children: [], parent_id: 10}
          ]
        }
      ]

      assert ElixirChallenge.transform(data) == expected
    end

    test "should put Red Roof to House's children and put Blue Roof to Condo's children" do
      data = %{
        0 => [
          %{id: 10, title: "House", level: 0, children: [], parent_id: nil},
          %{id: 11, title: "Condo", level: 0, children: [], parent_id: nil}
        ],
        1 => [
          %{id: 12, title: "Red Roof", level: 1, children: [], parent_id: 10},
          %{id: 18, title: "Blue Roof", level: 1, children: [], parent_id: 11}
        ]
      }

      expected = [
        %{
          id: 10,
          title: "House",
          level: 0,
          parent_id: nil,
          children: [
            %{id: 12, title: "Red Roof", level: 1, children: [], parent_id: 10}
          ]
        },
        %{
          id: 11,
          title: "Condo",
          level: 0,
          parent_id: nil,
          children: [
            %{id: 18, title: "Blue Roof", level: 1, children: [], parent_id: 11}
          ]
        }
      ]

      assert ElixirChallenge.transform(data) == expected
    end

    test "should work like example" do
      data = %{
        0 => [%{id: 10, title: "House", level: 0, children: [], parent_id: nil}],
        1 => [
          %{id: 12, title: "Red Roof", level: 1, children: [], parent_id: 10},
          %{id: 13, title: "Wall", level: 1, children: [], parent_id: 10},
          %{id: 18, title: "Blue Roof", level: 1, children: [], parent_id: 10}
        ],
        2 => [
          %{id: 17, title: "Blue Window", level: 2, children: [], parent_id: 12},
          %{id: 16, title: "Door", level: 2, children: [], parent_id: 13},
          %{id: 15, title: "Red Window", level: 2, children: [], parent_id: 12}
        ]
      }

      expected = [
        %{
          id: 10,
          title: "House",
          level: 0,
          parent_id: nil,
          children: [
            %{
              id: 12,
              title: "Red Roof",
              level: 1,
              children: [
                %{id: 17, title: "Blue Window", level: 2, children: [], parent_id: 12},
                %{id: 15, title: "Red Window", level: 2, children: [], parent_id: 12}
              ],
              parent_id: 10
            },
            %{
              id: 13,
              title: "Wall",
              level: 1,
              children: [
                %{id: 16, title: "Door", level: 2, children: [], parent_id: 13}
              ],
              parent_id: 10
            },
            %{id: 18, title: "Blue Roof", level: 1, children: [], parent_id: 10}
          ]
        }
      ]

      assert ElixirChallenge.transform(data) == expected
    end
  end
end
