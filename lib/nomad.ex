defmodule Nomad do
  def host do
    Application.get_env(:nomad, :host)
  end

  def version do
    Application.get_env(:nomad, :version)
  end
end
