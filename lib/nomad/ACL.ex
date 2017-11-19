defmodule Nomad.ACL do
  require Nomad

  @policy_path "/acl/policy"
  @token_path "/acl/token"

  Nomad.meta_get :policies, "/acl/policies"
  Nomad.meta_get :tokens, "/acl/tokens"

  def policy(name) do
    path = Path.join(@policy_path, name)
    Nomad.request(:get, [path])
  end

  def policy!(name) do
    path = Path.join(@policy_path, name)
    Nomad.request!(:get, [path])
  end

  def token(name) do
    path = Path.join(@token_path, name)
    Nomad.request(:get, [path])
  end

  def token!(name) do
    path = Path.join(@token_path, name)
    Nomad.request!(:get, [path])
  end
end
