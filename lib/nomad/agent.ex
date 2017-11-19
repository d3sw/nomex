defmodule Nomad.Agent do
  @health_path "/agent/health"
  @members_path "/agent/members"
  @self_path "/agent/self"
  @servers_path "/agent/servers"

  def health do
    Nomad.request(:get, [@health_path])
  end

  def health! do
    Nomad.request!(:get, [@health_path])
  end

  def members do
    Nomad.request(:get, [@members_path])
  end

  def members! do
    Nomad.request!(:get, [@members_path])
  end

  def self do
    Nomad.request(:get, [@self_path])
  end

  def self! do
    Nomad.request!(:get, [@self_path])
  end

  def servers do
    Nomad.request(:get, [@servers_path])
  end

  def servers! do
    Nomad.request!(:get, [@servers_path])
  end
end
