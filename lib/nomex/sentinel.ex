defmodule Nomex.Sentinel do
  require Nomex.Request
  alias Nomex.Request

  Request.meta_get :policies, "/sentinel/policies"
  Request.meta_get_id :policy, "/sentinel/policy"
end
