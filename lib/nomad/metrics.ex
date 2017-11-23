defmodule Nomad.Metrics do
  require Nomad.Request
  alias Nomad.Request

  Request.meta_get :metrics, "/metrics"
end
