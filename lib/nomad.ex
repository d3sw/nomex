defmodule Nomad do
  @moduledoc """
  Documentation for Nomad.
  """

  def host do
    Application.get_env(:nomad, :host)
  end

  @doc """
  Hello world.

  ## Examples

      iex> Nomad.hello
      :world

  """
  def version do
    Application.get_env(:nomad, :version)
  end

  def base do
    host = URI.parse(host())
    version = "/#{version()}"
    URI.merge(host, version) |> to_string
  end
end
