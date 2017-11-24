defmodule Nomex.Status do
  require Nomex.Request
  alias Nomex.Request

  Request.meta_get :leader, "/status/leader"
  Request.meta_get :peers, "/status/peers"
end
