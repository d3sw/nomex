defmodule Nomad.Allocations do
  require Nomad.Request
  alias Nomad.Request

  @index_path "/allocations"

  Request.meta_get :index, @index_path
  Request.meta_get_prefix :index, @index_path
  Request.meta_get_id :allocation, "/allocation"
end
