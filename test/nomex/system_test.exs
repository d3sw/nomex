defmodule Nomex.SystemTest do
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  test "gc" do
    use_cassette "system/gc" do
      { :ok, response } = Nomex.System.gc

      assert response.status_code == 200
      assert response.body == %{}
    end
  end

  test "gc!" do
    use_cassette "system/gc" do
      response = Nomex.System.gc!

      assert response.status_code == 200
      assert response.body == %{}
    end
  end

  test "reconcile/summaries" do
    use_cassette "system/reconcile/summaries" do
      { :ok, response } = Nomex.System.reconcile_summaries

      assert response.status_code == 200
      assert response.body == %{}
    end
  end

  test "reconcile/summaries!" do
    use_cassette "system/reconcile/summaries" do
      response = Nomex.System.reconcile_summaries!

      assert response.status_code == 200
      assert response.body == %{}
    end
  end
end
