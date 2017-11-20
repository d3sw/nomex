defmodule Nomad.Namespaces do
  require Nomad.Request
  alias Nomad.Request

  Request.meta_get :index, "/namespaces"
  Request.meta_get_id :namespace, "/namespace"
end
