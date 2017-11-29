defmodule Nomex.Allocations do
  require Nomex
  require Nomex.Request
  alias Nomex.Request

  Nomex.meta_moduledoc("Allocations", ["https://www.nomadproject.io/api/allocations.html"])

  @allocations_path "/allocations"

  Request.meta_get :allocations, @allocations_path
  Request.meta_get_prefix :allocations, @allocations_path
  Request.meta_get_id :allocation, "/allocation"
end
