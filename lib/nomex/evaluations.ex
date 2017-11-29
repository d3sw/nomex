defmodule Nomex.Evaluations do
  require Nomex
  require Nomex.Request
  alias Nomex.Request


  Nomex.meta_moduledoc("Evaluations", ["https://www.nomadproject.io/api/evaluations.html"])

  @evaluations_path "/evaluations"

  Request.meta_get :evaluations, @evaluations_path
  Request.meta_get_prefix :evaluations, @evaluations_path
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
