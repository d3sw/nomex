defmodule Nomex.RegionsTest do
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  test "regions" do
    use_cassette "regions" do
      { :ok, response } = Nomex.Regions.regions

      assert response.status_code == 200
      assert length(response.body) == 1

      [first] = response.body
      assert first == "global"
    end
  end
end
