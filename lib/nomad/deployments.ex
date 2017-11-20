defmodule Nomad.Deployments do
  require Nomad.Request
  alias Nomad.Request

  Request.meta_get :index, "/deployments"
  Request.meta_get_id :deployment, "/deployment"
  Request.meta_get_id :allocations, "/deployment/allocations"
end
