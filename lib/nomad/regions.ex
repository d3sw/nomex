defmodule Nomad.Regions do
  require Nomad.Request
  alias Nomad.Request

  Request.meta_get :index, "/regions"
end
