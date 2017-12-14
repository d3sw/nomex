defmodule Nomex.ClientTest do
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  test "stats" do
    use_cassette "client/stats" do
      { :ok, response } = Nomex.Client.stats

      assert response.status_code == 200

      keys = [
        "AllocDirStats",
        "CPU",
        "DiskStats",
        "Memory",
        "Timestamp",
        "Uptime"
      ]

      Enum.each keys, fn(key) ->
        assert Map.has_key?(response.body, key)
      end
    end
  end
end
