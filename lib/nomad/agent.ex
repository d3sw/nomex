defmodule Nomad.Agent do
  require Nomad

  Nomad.meta_get :members, "/agent/members"
  Nomad.meta_get :self, "/agent/self"
  Nomad.meta_get :servers, "/agent/servers"
  Nomad.meta_get :health, "/agent/health"
end
