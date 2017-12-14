defmodule Nomex.AgentTest do
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  test "members" do
    use_cassette "agent/members" do
      { :ok, response } = Nomex.Agent.members

      assert response.status_code == 200
      assert length(response.body["Members"]) == 1
    end
  end

  test "self" do
    use_cassette "agent/self" do
      { :ok, response } = Nomex.Agent.self

      assert response.status_code == 200
      assert Map.has_key? response.body, "config"
    end
  end

  test "servers" do
    use_cassette "agent/servers" do
      { :ok, response } = Nomex.Agent.servers

      assert response.status_code == 200
      assert length(response.body) == 1
    end
  end

  test "health" do
    use_cassette "agent/health" do
      { :ok, response } = Nomex.Agent.health

      assert response.status_code == 200
      assert Map.has_key? response.body, "client"
      assert Map.has_key? response.body, "server"
    end
  end
end
