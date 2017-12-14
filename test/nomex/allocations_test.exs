defmodule Nomex.AllocationsTest do
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  test "allocations" do
    use_cassette "allocations" do
      { :ok, response } = Nomex.Allocations.allocations

      assert response.status_code == 200
      assert response.body == []
    end
  end
end
