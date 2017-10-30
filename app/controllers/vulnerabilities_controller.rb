class VulnerabilitiesController < ApplicationController
  before_action :set_vulnerability, only: [:show, :edit, :update, :destroy]

  # GET /vulnerabilities
  # GET /vulnerabilities.json
  def index
    @vulnerabilities = Vulnerability.all
  end

  # GET /vulnerabilities/1
  # GET /vulnerabilities/1.json
  def show
  end
  # POST /vulnerabilities
  # POST /vulnerabilities.json

  # DELETE /vulnerabilities/1
  # DELETE /vulnerabilities/1.json

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vulnerability
      @vulnerability = Vulnerability.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vulnerability_params
      params.fetch(:vulnerability, {})
    end
end
