class Admin::ActiveVulnerabilitiesController < ApplicationController
  layout :layout_by_resource
  respond_to :json, :html
  before_action :set_activevulnerability, only: [:show, :edit, :update, :destroy]

  def index
    @activevulnerabilities = ActiveVulnerability.all
  end

  def edit
    @url = admin_active_vulnerabilities_path(@activevulnerabilities)
  end

  def update
    if @activevulnerabilities.update(activevulnerability_params)
      flash[:notice] = t('admin.active_vuln.update.success')
      respond_with :edit, :admin, @activevulnerabilities
    else
      flash[:warning] = @user.errors.full_messages.uniq.join(', ')
      respond_with :edit, :admin, :active_vulnerability
      end
  end


  private def layout_by_resource
    if devise_controller?
      'layouts/devise'
    else
      'admin/layouts/admin'
    end
  end
  private def set_activevulnerability
    @activevulnerabilities = ActiveVulnerability.find(params[:id])
  end
  private def activevulnerability_params
    params.require(:active_vulnerability).permit(:displayname, :vulncount, :active)
  end
end
