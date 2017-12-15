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

  defmacro meta_moduledoc(name, urls \\ []) do
    urls_formatted = Enum.map(urls, fn(url) -> "[#{url}](#{url})" end)
      |> Enum.join("\n\n")

    quote do
      @moduledoc """
      Methods in this module are used to interact with Nomad's #{unquote(name)} HTTP API. More information here:

      #{unquote(urls_formatted)}
      """
    end
  end

  @doc """
  returns Nomad ACL token if it is specified in `config/config.exs`
  ## Example

      iex> Nomex.token
      "936a095f-68da-c19a-0a65-4794b0ea74e5"

  """

  @spec token :: String.t
  def token do
    Application.get_env(:nomex, :nomad_token)
  end
end
