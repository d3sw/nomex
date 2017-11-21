defmodule Nomad.Nodes do
  require Nomad.Request
  alias Nomad.Request

  Request.meta_get :index, "/nodes"
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
