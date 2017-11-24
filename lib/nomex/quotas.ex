defmodule Nomex.Quotas do
  require Nomex.Request
  alias Nomex.Request

  @quotas_path "/quotas"
  @quota_usages_path "/quota-usages"

  Request.meta_get :quotas, @quotas_path
  Request.meta_get_prefix :quotas, @quotas_path
  Request.meta_get :quota_usages, @quota_usages_path
  Request.meta_get_prefix :quota_usages, @quota_usages_path

  Request.meta_get_id :quota, "/quota"
  Request.meta_get_id :quota_usage, "/quota/usage"
end
