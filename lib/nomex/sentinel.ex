defmodule Nomex.Sentinel do
  require Nomex
  require Nomex.Request
  alias Nomex.Request

  Nomex.meta_moduledoc("Sentinel Policies", ["https://www.nomadproject.io/api/sentinel-policies.html"])

  Request.meta_get :policies, "/sentinel/policies"
  Request.meta_get_id :policy, "/sentinel/policy"
end
