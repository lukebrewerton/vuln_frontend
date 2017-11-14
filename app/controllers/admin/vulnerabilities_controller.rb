class Admin::VulnerabilitiesController < ApplicationController
  layout :layout_by_resource
  def index
    @vulnerabilities = Vulnerability.all
  end

  private def layout_by_resource
    if devise_controller?
      'layouts/devise'
    else
      'admin/layouts/admin'
    end
  end
end
