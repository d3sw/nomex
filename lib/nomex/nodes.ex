defmodule Nomex.Nodes do
  require Nomex
  require Nomex.Request
  alias Nomex.Request

  Nomex.meta_moduledoc("Nodes", ["https://www.nomadproject.io/api/nodes.html"])

  @nodes_path "/nodex"

  Request.meta_get :nodes, @nodes_path
  Request.meta_get_prefix :nodes, @nodes_path
  Request.meta_get :node, "/node"


  def allocations(node_id) do
    Request.request(:get, [allocation_path(node_id)])
  end

  def allocations!(node_id) do
    Request.request!(:get, [allocation_path(node_id)])
  end

  defp allocation_path(node_id) do
    "/node"
    |> Path.join(node_id)
    |> Path.join("allocations")
  end
end
