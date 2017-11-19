defmodule Nomad.Allocations do
  require Nomad

  @index_path "/allocations"

  Nomad.meta_get :index, @index_path
  Nomad.meta_get_id :allocation, "/allocation"

  def index(prefix) do
    path = "#{@index_path}?prefix=#{prefix}"
    Nomad.request(:get, [path])
  end

  def index!(prefix) do
    path = "#{@index_path}?prefix=#{prefix}"
    Nomad.request!(:get, [path])
  end
end
