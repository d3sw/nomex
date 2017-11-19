defmodule Nomad do
  alias Nomad.Response
  require Logger
  use HTTPoison.Base


  def host do
    Application.get_env(:nomad, :host)
  end

  def version do
    Application.get_env(:nomad, :version)
  end

  def base do
    host = URI.parse(host())
    version = "/#{version()}"
    URI.merge(host, version) |> to_string
  end

  def process_url(url) do
    base() <> url
  end

  def request(method, url) do
    apply(Nomad, method, url)
  end

  def request!(method, url) do
    response = apply(Nomad, :"#{method}!", url)
    Response.parse response
  end
end
