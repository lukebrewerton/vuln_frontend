module ActiveVulnerabilitiesHelper

  private def activevulnerability_params
    params.require(:activevulberabilities).permit(:active)
  end
end
