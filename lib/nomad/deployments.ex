defmodule Nomad.Deployments do
  require Nomad.Request
  alias Nomad.Request

  @deployments_path "/deployments"

  Request.meta_get :deployments, @deployments_path
  Request.meta_get_prefix :deployments, @deployments_path
  Request.meta_get_id :deployment, "/deployment"
  Request.meta_get_id :allocations, "/deployment/allocations"
end
