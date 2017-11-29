defmodule Nomex.Deployments do
  require Nomex
  require Nomex.Request
  alias Nomex.Request

  Nomex.meta_moduledoc("Deployments", ["https://www.nomadproject.io/api/deployments.html"])

  @deployments_path "/deployments"

  Request.meta_get :deployments, @deployments_path
  Request.meta_get_prefix :deployments, @deployments_path
  Request.meta_get_id :deployment, "/deployment"
  Request.meta_get_id :allocations, "/deployment/allocations"
end
