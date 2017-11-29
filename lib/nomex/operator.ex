defmodule Nomex.Operator do
  require Nomex
  require Nomex.Request
  alias Nomex.Request

  Nomex.meta_moduledoc("Operator", ["https://www.nomadproject.io/api/operator.html"])

  @raft_configuration_path "/operator/raft/configuration"

  Request.meta_get :raft_configuration, @raft_configuration_path
end
