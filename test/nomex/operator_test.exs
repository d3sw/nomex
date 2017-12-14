defmodule Nomex.OperatorTest do
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  test "raft_configuration" do
    use_cassette "operator/raft/configuration" do
      { :ok, response } = Nomex.Operator.raft_configuration

      assert response.status_code == 200
      assert length(response.body["Servers"]) == 1
    end
  end
end
