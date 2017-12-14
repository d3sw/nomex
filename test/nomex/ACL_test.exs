defmodule Nomex.ACLTest do
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  describe "when ACL support is disabled" do
    test "policies" do
      use_cassette "ACL/policies/acl_disabled" do
        { :ok, response } = Nomex.ACL.policies

        assert response.status_code == 500
        assert response.body.error == "ACL support disabled"
      end
    end

    test "tokens" do
      use_cassette "ACL/tokens/acl_disabled" do
        { :ok, response } = Nomex.ACL.tokens

        assert response.status_code == 500
        assert response.body.error == "ACL support disabled"
      end
    end

    test "token_self" do
      use_cassette "ACL/token_self/acl_disabled" do
        { :ok, response } = Nomex.ACL.tokens

        assert response.status_code == 500
        assert response.body.error == "ACL support disabled"
      end
    end
  end
end
