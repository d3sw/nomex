defmodule Nomex.Regions do
  require Nomex
  require Nomex.Request
  alias Nomex.Request

  Nomex.meta_moduledoc("Regions", ["https://www.nomadproject.io/api/regions.html"])

  Request.meta_get :regions, "/regions"
end
