defmodule Nomad.Agent do
  require Nomad.Request
  alias Nomad.Request

  Request.meta_get :members, "/agent/members"
  Request.meta_get :self, "/agent/self"
  Request.meta_get :servers, "/agent/servers"
  Request.meta_get :health, "/agent/health"
end
