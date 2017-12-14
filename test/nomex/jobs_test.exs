defmodule Nomex.JobsTest do
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  test "jobs" do
    use_cassette "jobs" do
      { :ok, response } = Nomex.Jobs.jobs

      assert response.status_code == 200
      assert length(response.body) == 0
    end
  end
end
