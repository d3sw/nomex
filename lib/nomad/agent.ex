defmodule Nomad.Agent do
  @self_path "/agent/self"

  def self do
    Nomad.request(:get, [@self_path])
  end

  def self! do
    Nomad.request!(:get, [@self_path])
  end
end
