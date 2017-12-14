defmodule Nomex.NodesTest do
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  test "nodes" do
    use_cassette "nodes" do
      { :ok, response } = Nomex.Nodes.nodes

      assert response.status_code == 200
      assert length(response.body) == 1
    end
  end

  test "allocations" do
    use_cassette "node/allocations" do
      [node] = Nomex.Nodes.nodes!.body

      { :ok, response } = Nomex.Nodes.allocations(node["ID"])

      assert response.status_code == 200
      assert length(response.body) == 0
    end
  end
end
