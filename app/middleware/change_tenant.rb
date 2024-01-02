require 'apartment/elevators/generic'
class ChangeTenant < Apartment::Elevators::Generic

  def call(env)
    super
  rescue Apartment::TenantNotFound
    return [
      400,
      content_type_json,
      response_error(I18n.t("errors.invalid_tenant"))
    ]
  end

  # @return {String} - The tenant to switch to
  def parse_tenant_name(request)
    # request is an instance of Rack::Request
    request.env['HTTP_X_API_TENANT'] || request.env['X_API_TENANT'] || Tenant::DEFAULT_SCHEMA
  end

  def content_type_json
    {"Content-Type" => "application/json"}
  end

  def response_error message
    [{
       status: "fail",
       message: message,
       errors: [],
       error_code: nil
     }.to_json]
  end
end
