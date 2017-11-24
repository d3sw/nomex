defmodule Nomex.Metrics do
  require Nomex.Request
  alias Nomex.Request

  Request.meta_get :metrics, "/metrics"
end
