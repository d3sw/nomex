defmodule Nomad.Operator do
  require Nomad.Request
  alias Nomad.Request

  @raft_configuration_path "/operator/raft/configuration"

  Request.meta_get :raft_configuration, @raft_configuration_path
end
