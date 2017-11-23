defmodule Nomad.Jobs do
  require Nomad.Request
  alias Nomad.Request

  @jobs_path "/jobs"

  Request.meta_get :jobs, @jobs_path
  Request.meta_get_prefix :jobs, @jobs_path
end
