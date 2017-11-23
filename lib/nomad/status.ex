defmodule Nomad.Status do
  require Nomad.Request
  alias Nomad.Request

  Request.meta_get :leader, "/status/leader"
  Request.meta_get :peers, "/status/peers"
end
