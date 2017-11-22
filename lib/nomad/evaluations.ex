defmodule Nomad.Evaluations do
  require Nomad.Request
  alias Nomad.Request

  @evaluations_path "/evaluations"

  Request.meta_get :index, @evaluations_path
  Request.meta_get_prefix :index, @evaluations_path
  Request.meta_get_id :evaluation, "/evaluation"

  def allocations(evaluation_id) do
    Request.request(:get, [allocation_path(evaluation_id)])
  end

  def allocations!(evaluation_id) do
    Request.request!(:get, [allocation_path(evaluation_id)])
  end

  defp allocation_path(evaluation_id) do
    "/evaluation"
    |> Path.join(evaluation_id)
    |> Path.join("allocations")
  end
end
