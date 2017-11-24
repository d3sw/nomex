defmodule Nomex.Regions do
  require Nomex.Request
  alias Nomex.Request

  Request.meta_get :regions, "/regions"
end
