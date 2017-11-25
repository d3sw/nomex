defmodule Nomex.Request do
  alias Nomex.{ Request, Response }
  use HTTPoison.Base


  defmacro meta_get(function_name, path) do
    function_name! = banged function_name

    quote do
      @spec unquote(function_name)() :: Response.tuple_t
      def unquote(function_name)() do
        Request.request(:get, [unquote(path)])
      end

      @spec unquote(function_name!)() :: Response.t
      def unquote(function_name!)() do
        Request.request!(:get, [unquote(path)])
      end
    end
  end

  defmacro meta_get_id(function_name, path) do
    function_name! = banged function_name

    quote do
      @spec unquote(function_name)(String.t) :: Response.tuple_t
      def unquote(function_name)(param_id) do
        path = Path.join unquote(path), param_id
        Request.request(:get, [path])
      end

      @spec unquote(function_name!)(String.t) :: Response.t
      def unquote(function_name!)(param_id) do
        path = Path.join unquote(path), param_id
        Request.request!(:get, [path])
      end
    end
  end

  defmacro meta_get_prefix(function_name, path) do
    function_name! = banged function_name

    quote do
      @spec unquote(function_name)(String.t) :: Response.tuple_t
      def unquote(function_name)(prefix) do
        params = [ params: %{ prefix: prefix } ]
        Request.request(:get, [unquote(path), [], params])
      end

      @spec unquote(function_name!)(String.t) :: Response.t
      def unquote(function_name!)(prefix) do
        params = [ params: %{ prefix: prefix } ]
        Request.request!(:get, [unquote(path), [], params])
      end
    end
  end

  def base do
    host = URI.parse(Nomex.host())
    version = "/#{Nomex.version()}"
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

  defp banged(function_name) do
    :"#{function_name}!"
  end
end
