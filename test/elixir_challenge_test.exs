defmodule ElixirChallengeTest do
  use ExUnit.Case
  doctest ElixirChallenge

  test "greets the world" do
    assert ElixirChallenge.hello() == :world
  end
end
