defmodule Nomad do
  alias Nomad.Response
  require Logger
  use HTTPoison.Base

  defmacro meta_get(function_name, path) do
    quote do
      def unquote(function_name)() do
        Nomad.request(:get, [unquote(path)])
      end

      def unquote(:"#{function_name}!")() do
        Nomad.request!(:get, [unquote(path)])
      end
    end
  end

  defmacro meta_get_id(function_name, path) do
    quote do
      def unquote(function_name)(param_id) do
        path = Path.join unquote(path), param_id
        Nomad.request(:get, [path])
      end

      def unquote(function_name)(param_id) do
        path = Path.join unquote(path), param_id
        Nomad.request!(:get, [path])
      end
    end
  end

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

  # consider removing these methods, too much abstraction?
  def request(method, params) do
    { status, response } = apply(Nomad, method, params)
    { status, Response.parse(response) }
  end

  def request!(method, params) do
    response = apply(Nomad, :"#{method}!", params)
    Response.parse response
  end
end
