defmodule Nomex.DeploymentsTest do
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  test "deployments" do
    use_cassette "deployments" do
      { :ok, response } = Nomex.Deployments.deployments

      assert response.status_code == 200
      assert length(response.body) == 0
    end
  end
end
