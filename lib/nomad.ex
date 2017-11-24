defmodule Nomex do
  def host do
    Application.get_env(:nomex, :nomad_host)
  end

  def version do
    Application.get_env(:nomex, :nomad_version)
  end
end
