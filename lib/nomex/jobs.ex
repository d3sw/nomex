defmodule Nomex.Jobs do
  require Nomex
  require Nomex.Request
  alias Nomex.Request

  Nomex.meta_moduledoc("Jobs", ["https://www.nomadproject.io/api/jobs.html"])

  @jobs_path "/jobs"

  Request.meta_get :jobs, @jobs_path
  Request.meta_get_prefix :jobs, @jobs_path
  Request.meta_get_id :job, "/job"

  def job_versions(job_id) do
    Request.request(:get, [job_versions_path(job_id)])
  end

  def job_versions!(job_id) do
    Request.request!(:get, [job_versions_path(job_id)])
  end

  defp job_versions_path(job_id) do
    "/job"
    |> Path.join(job_id)
    |> Path.join("versions")
  end

  def job_allocations(job_id) do
    Request.request(:get, [job_allocations_path(job_id)])
  end

  def job_allocations!(job_id) do
    Request.request!(:get, [job_allocations_path(job_id)])
  end

  defp job_allocations_path(job_id) do
    "/job"
    |> Path.join(job_id)
    |> Path.join("allocations")
  end

  def job_evaluations(job_id) do
    Request.request(:get, [job_evaluations_path(job_id)])
  end

  def job_evaluations!(job_id) do
    Request.request!(:get, [job_evaluations_path(job_id)])
  end

  defp job_evaluations_path(job_id) do
    "/job"
    |> Path.join(job_id)
    |> Path.join("evaluations")
  end

  def job_deployments(job_id) do
    Request.request(:get, [job_deployments_path(job_id)])
  end

  def job_deployments!(job_id) do
    Request.request!(:get, [job_deployments_path(job_id)])
  end

  defp job_deployments_path(job_id) do
    "/job"
    |> Path.join(job_id)
    |> Path.join("deployments")
  end

  def job_deployment(job_id) do
    Request.request(:get, [job_deployment_path(job_id)])
  end

  def job_deployment!(job_id) do
    Request.request!(:get, [job_deployment_path(job_id)])
  end

  defp job_deployment_path(job_id) do
    "/job"
    |> Path.join(job_id)
    |> Path.join("deployment")
  end

  def job_summary(job_id) do
    Request.request(:get, [job_summary_path(job_id)])
  end

  def job_summary!(job_id) do
    Request.request!(:get, [job_summary_path(job_id)])
  end

  defp job_summary_path(job_id) do
    "/job"
    |> Path.join(job_id)
    |> Path.join("summary")
  end
end
