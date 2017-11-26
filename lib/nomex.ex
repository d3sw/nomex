defmodule Nomex do
  @moduledoc """
  Base module for Nomex, used to access Nomad settings
  """

  @doc """
  returns Nomad host, configurable in `config/config.exs`

  ## Example

      iex> Nomex.host
      "http://127.0.0.1:4646"

  """
  @spec host :: String.t
  def host do
    Application.get_env(:nomex, :nomad_host)
  end

  @doc """
  returns Nomad API version
  ## Example

      iex> Nomex.version
      "v1"

  """
  @spec version :: String.t
  def version do
    Application.get_env(:nomex, :nomad_version)
  end
end
