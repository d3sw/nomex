defmodule Nomad.Namespaces do
  require Nomad.Request
  alias Nomad.Request

  @namespaces_path "/namespaces"

  Request.meta_get :namespaces, @namespaces_path
  Request.meta_get_prefix :namespaces, @namespaces_path
  Request.meta_get_id :namespace, "/namespace"
end
