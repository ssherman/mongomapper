# encoding: UTF-8
module MongoMapper
  module Plugins
    def plugins
      @plugins ||= []
    end

    def plugin(mod)
      extend mod::ClassMethods     if mod.constants.include?(:ClassMethods)
      include mod::InstanceMethods if mod.constants.include?(:InstanceMethods)
      mod.configure(self)          if mod.respond_to?(:configure)
      plugins << mod
    end
  end
end
