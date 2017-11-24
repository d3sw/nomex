defmodule Nomex.Allocations do
  require Nomex.Request
  alias Nomex.Request

  @allocations_path "/allocations"

  Request.meta_get :allocations, @allocations_path
  Request.meta_get_prefix :allocations, @allocations_path
  Request.meta_get_id :allocation, "/allocation"
end
