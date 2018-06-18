defmodule PushServerTest do
  use ExUnit.Case
  doctest PushServer

  test "greets the world" do
    assert PushServer.hello() == :world
  end
end
