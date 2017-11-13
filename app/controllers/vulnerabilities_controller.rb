class VulnerabilitiesController < ApplicationController
  before_action :set_vulnerabilities
  before_action :set_vulnerability, only: [:show, :edit, :update, :destroy]

  # GET admins/1/vulnerabilities
  def index
    @vulnerabilities = @admin.vulnerabilities
  end

  # GET admins/1/vulnerabilities/1
  def show
  end

  # GET admins/1/vulnerabilities/new
  def new
    @vulnerability = @admin.vulnerabilities.build
  end

  # GET admins/1/vulnerabilities/1/edit
  def edit
  end

  # POST admins/1/vulnerabilities
  def create
    @vulnerability = @admin.vulnerabilities.build(vulnerability_params)

    if @vulnerability.save
      redirect_to([@vulnerability.admin, @vulnerability], notice: 'Vulnerability was successfully created.')
    else
      render action: 'new'
    end
  end

  # PUT admins/1/vulnerabilities/1
  def update
    if @vulnerability.update_attributes(vulnerability_params)
      redirect_to([@vulnerability.admin, @vulnerability], notice: 'Vulnerability was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE admins/1/vulnerabilities/1
  def destroy
    @vulnerability.destroy

    redirect_to admin_vulnerabilities_url(@admin)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vulnerabilities
      @admin = Admin.find(params[:admin_id])
    end

    def set_vulnerability
      @vulnerability = @admin.vulnerabilities.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def vulnerability_params
      params.require(:vulnerability).permit(:id, :description)
    end
end
