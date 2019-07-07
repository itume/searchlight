module Relation
  def define_readers(mixin, name)
    mixin.class_eval <<-CODE, __FILE__, __LINE__ + 1
      def #{name}
        Rails.application.config.searchlight_logger.debug "relation: #{name}" unless self.class.instance_variable_get("@_#{name}")
        self.class.instance_variable_set("@_#{name}", true)
        association(:#{name}).reader
      end
    CODE
  end
end
ActiveRecord::Associations::Builder::Association.singleton_class.prepend(Relation)
