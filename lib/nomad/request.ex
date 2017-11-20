defmodule Nomad.Request do
  alias Nomad.{ Request, Response }
  use HTTPoison.Base

  defmacro meta_get(function_name, path) do
    quote do
      def unquote(function_name)() do
        Request.request(:get, [unquote(path)])
      end

      def unquote(:"#{function_name}!")() do
        Request.request!(:get, [unquote(path)])
      end
    end
  end

  defmacro meta_get_id(function_name, path) do
    quote do
      def unquote(function_name)(param_id) do
        path = Path.join unquote(path), param_id
        Request.request(:get, [path])
      end

      def unquote(function_name)(param_id) do
        path = Path.join unquote(path), param_id
        Request.request!(:get, [path])
      end
    end
  end

  def base do
    host = URI.parse(Nomad.host())
    version = "/#{Nomad.version()}"
    URI.merge(host, version) |> to_string
  end

  def process_url(url) do
    base() <> url
  end

  # consider removing these methods, too much abstraction?
  def request(method, params) do
    { status, response } = apply(Request, method, params)
    { status, Response.parse(response) }
  end

  def request!(method, params) do
    response = apply(Request, :"#{method}!", params)
    Response.parse response
  end
end
