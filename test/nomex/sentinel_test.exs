defmodule Nomex.SentinelTest do
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  test "policies" do
    use_cassette "sentinel/policies" do
      { :ok, response } = Nomex.Sentinel.policies

      assert response.status_code == 501
      assert response.body.error == "Nomad Enterprise only endpoint"
    end
  end
end
