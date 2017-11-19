defmodule Nomad.ACL do
  @policies_path "/acl/policies"

  def policies! do
    Nomad.request!(:get, [@policies_path])
  end
end
