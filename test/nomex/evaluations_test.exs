defmodule Nomex.EvaluationsTest do
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  test "evaluations" do
    use_cassette "evaluations" do
      { :ok, response } = Nomex.Evaluations.evaluations

      assert response.status_code == 200
      assert length(response.body) == 0
    end
  end
end
