defmodule Nomex.StatusTest do
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  test "leader" do
    use_cassette "status/leader" do
      { :ok, response } = Nomex.Status.leader

      assert response.status_code == 200
      assert response.body == "127.0.0.1:4647"
    end
  end

  test "peers" do
    use_cassette "status/peers" do
      { :ok, response } = Nomex.Status.peers

      assert response.status_code == 200
      assert length(response.body) == 1
    end
  end
end
