class Admin::ActiveVulnerabilitiesController < ApplicationController
  layout :layout_by_resource
  def index
    @activevulnerabilities = ActiveVulnerability.all
  end

  def edit
    @activevulnerabilities = ActiveVulnerability.find(params[:id])
  end

  def update
    attributes = av_params.clone
    if @activevulnerabilities.update(av_params)
      flash[:notice] = t('admin.active_vuln.update.success')
      respond_with :edit, :admin, @activevulnerability
    else
      flash[:warning] = @activevulnerabilities.errors.full_messages.uniq.join(', ')
      respond_with :edit, :admin, :activevulnerability
    end
  end

  private def layout_by_resource
    if devise_controller?
      'layouts/devise'
    else
      'admin/layouts/admin'
    end
  end

  private def av_params
    params.require(:activevulnerability).permit(:displayname, :vulncount, :active)
  end
end
