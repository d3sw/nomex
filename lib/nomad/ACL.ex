defmodule Nomad.ACL do
  @policies_path "/acl/policies"
  @policy_path "/acl/policy"
  @tokens_path "/acl/tokens"
  @token_path "/acl/token"

  def policies do
    Nomad.request(:get, [@policies_path])
  end

  def policies! do
    Nomad.request!(:get, [@policies_path])
  end

  def policy(name) do
    path = Path.join(@policy_path, name)
    Nomad.request(:get, [path])
  end

  def policy!(name) do
    path = Path.join(@policy_path, name)
    Nomad.request!(:get, [path])
  end

  def tokens do
    Nomad.request(:get, [@tokens_path])
  end

  def tokens! do
    Nomad.request!(:get, [@tokens_path])
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
