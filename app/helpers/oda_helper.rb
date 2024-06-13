module OdaHelper
  def json_details(resource)
    render partial: "oda/json_details", locals: { resource: }
  end
end
