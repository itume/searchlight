module Model
  def initialize(attributes = {})
    varname = self.class.to_s.downcase
    Rails.application.config.searchlight_logger.warn "model: #{varname}"varname unless self.class.instance_variable_get("@_#{varname}")
    self.class.instance_variable_set("@_#{varname}", true)
    super
  end
end
ActiveRecord::Base.prepend(Model)
