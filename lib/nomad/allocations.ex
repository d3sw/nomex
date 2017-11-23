defmodule Nomad.Allocations do
  require Nomad.Request
  alias Nomad.Request

  @allocations_path "/allocations"

  Request.meta_get :allocations, @allocations_path
  Request.meta_get_prefix :allocations, @allocations_path
  Request.meta_get_id :allocation, "/allocation"
end
