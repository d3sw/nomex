defmodule Nomex.Status do
  require Nomex
  require Nomex.Request
  alias Nomex.Request

  Nomex.meta_moduledoc("Status", ["https://www.nomadproject.io/api/status.html"])

  Request.meta_get :leader, "/status/leader"
  Request.meta_get :peers, "/status/peers"
end
