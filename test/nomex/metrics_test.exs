defmodule Nomex.MetricsTest do
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  test "metrics" do
    use_cassette "metrics" do
      { :ok, response } = Nomex.Metrics.metrics

      assert response.status_code == 200
    end
  end
end
