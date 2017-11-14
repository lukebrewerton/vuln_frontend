class Admin::VulnerabilitiesController < ApplicationController
  layout :layout_by_resource
  before_action :set_vulnerability, only: [:show, :edit, :update, :destroy]

  def index
    @vulnerabilities = Vulnerability.all
  end

  def show
    @vulnerabilities = Vulnerability.find(params[:id])
  end

  private def set_vulnerability
    @vulnerabilities = Vulnerability.find(params[:id])
  end
  private def layout_by_resource
    if devise_controller?
      'layouts/devise'
    else
      'admin/layouts/admin'
    end
  end
end
