defmodule Nomex.NamespacesTest do
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  test "namespaces" do
    use_cassette "namespaces" do
      { :ok, response } = Nomex.Namespaces.namespaces

      assert response.status_code == 501
      assert response.body.error == "Nomad Enterprise only endpoint"
    end
  end
end
