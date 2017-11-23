defmodule Nomad.Client do
  require Nomad.Request
  alias Nomad.Request

  Request.meta_get :stats, "/client/stats"

  def allocation_stats(allocation_id) do
    Request.request(
      :get,
      [allocation_stats_path(allocation_id)]
    )
  end

  def allocation_stats!(allocation_id) do
    Request.request!(
      :get,
      [allocation_stats_path(allocation_id)]
    )
  end

  defp allocation_stats_path(allocation_id) do
    "/client/allocation"
    |> Path.join(allocation_id)
    |> Path.join("stats")
  end
end
