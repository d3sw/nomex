defmodule Nomex.ACL do
  require Nomex
  require Nomex.Request
  alias Nomex.Request

  Nomex.meta_moduledoc(
    "ACL",
    ["https://www.nomadproject.io/api/acl-policies.html", "https://www.nomadproject.io/api/acl-tokens.html"]
  )

  Request.meta_get :policies, "/acl/policies"
  Request.meta_get :tokens, "/acl/tokens"
  Request.meta_get :token_self, "/acl/token/self"
  Request.meta_get_id :policy, "/acl/policy"
  Request.meta_get_id :token, "/acl/token"

  def create_or_update(name, description \\ "", rules) do
    Request.request(
      :post,
      create_or_update_params(name, description, rules)
    )
  end

  def create_or_update!(name, description \\ "", rules) do
    Request.request!(
      :post,
      create_or_update_params(name, description, rules)
    )
  end

  defp create_or_update_params(name, description, rules) do
    [
      create_or_update_path(name),
      create_or_update_payload(name, description, rules)
    ]
  end

  def bootstrap do
    Request.request(:post, ["/acl/bootstrap", ""])
  end

  def bootstrap! do
    Request.request!(:post, ["/acl/bootstrap", ""])
  end

  defp create_or_update_path(name) do
    Path.join "/acl/policy", name
  end

  defp create_or_update_payload(name, description, rules) do
    %{
      "Name" => name,
      "Description" => description,
      "Rules" => rules
    }
      |> Poison.encode!
  end
end
