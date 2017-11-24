defmodule Nomex.ACL do
  require Nomex.Request
  alias Nomex.Request

  Request.meta_get :policies, "/acl/policies"
  Request.meta_get :tokens, "/acl/tokens"
  Request.meta_get :token_self, "/acl/token/self"
  Request.meta_get_id :policy, "/acl/policy"
  Request.meta_get_id :token, "/acl/token"
end
