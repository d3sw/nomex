defmodule Nomex.Metrics do
  require Nomex
  require Nomex.Request
  alias Nomex.Request

  Nomex.meta_moduledoc("Metrics", ["https://www.nomadproject.io/api/metrics.html"])

  Request.meta_get :metrics, "/metrics"
end
