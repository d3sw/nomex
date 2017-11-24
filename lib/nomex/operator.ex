defmodule Nomex.Operator do
  require Nomex.Request
  alias Nomex.Request

  @raft_configuration_path "/operator/raft/configuration"

  Request.meta_get :raft_configuration, @raft_configuration_path
end
