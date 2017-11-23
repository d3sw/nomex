defmodule Nomad.Sentinel do
  require Nomad.Request
  alias Nomad.Request

  Request.meta_get :policies, "/sentinel/policies"
  Request.meta_get_id :policy, "/sentinel/policy"
end
