defmodule Nomad.ACL do
  require Nomad

  Nomad.meta_get :policies, "/acl/policies"
  Nomad.meta_get :tokens, "/acl/tokens"
  Nomad.meta_get_id :policy, "/acl/policy"
  Nomad.meta_get_id :token, "/acl/token"
end
