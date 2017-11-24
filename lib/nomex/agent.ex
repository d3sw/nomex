defmodule Nomex.Agent do
  require Nomex.Request
  alias Nomex.Request

  Request.meta_get :members, "/agent/members"
  Request.meta_get :self, "/agent/self"
  Request.meta_get :servers, "/agent/servers"
  Request.meta_get :health, "/agent/health"
end
