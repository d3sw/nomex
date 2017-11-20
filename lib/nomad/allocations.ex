defmodule Nomad.Allocations do
  require Nomad.Request
  alias Nomad.Request

  @index_path "/allocations"

  Request.meta_get :index, @index_path
  Request.meta_get_id :allocation, "/allocation"

  def index(prefix) do
    path = "#{@index_path}?prefix=#{prefix}"
    Request.request(:get, [path])
  end

  def index!(prefix) do
    path = "#{@index_path}?prefix=#{prefix}"
    Request.request!(:get, [path])
  end
end
