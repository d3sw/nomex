defmodule Nomex.QuotasTest do
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  test "quotas" do
    use_cassette "quotas" do
      { :ok, response } = Nomex.Quotas.quotas

      assert response.status_code == 501
      assert response.body.error == "Nomad Enterprise only endpoint"
    end
  end

  test "quota-usages" do
    use_cassette "quota-usages" do
      { :ok, response } = Nomex.Quotas.quota_usages

      assert response.status_code == 501
      assert response.body.error == "Nomad Enterprise only endpoint"
    end
  end
end
