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
end
