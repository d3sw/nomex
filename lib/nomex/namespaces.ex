defmodule Nomex.Namespaces do
  require Nomex
  require Nomex.Request
  alias Nomex.Request

  Nomex.meta_moduledoc("Namespaces", ["https://www.nomadproject.io/api/namespaces.html"])

  @namespaces_path "/namespaces"

  Request.meta_get :namespaces, @namespaces_path
  Request.meta_get_prefix :namespaces, @namespaces_path
  Request.meta_get_id :namespace, "/namespace"
end
