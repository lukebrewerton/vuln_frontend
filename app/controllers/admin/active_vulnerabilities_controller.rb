class Admin::ActiveVulnerabilitiesController < ApplicationController
  layout :layout_by_resource
  def index
    @activevulnerabilities = ActiveVulnerability.all
  end

  private def layout_by_resource
    if devise_controller?
      'layouts/devise'
    else
      'admin/layouts/admin'
    end
  end
end
