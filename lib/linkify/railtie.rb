require 'linkify'
require 'linkify/models/active_record'

module Linkify
  if defined? Rails::Railtie
    require 'rails'
    class Railtie < Rails::Railtie
      initializer 'railtie.insert_into_active_record' do
        ActiveSupport.on_load :active_record do
          Linkify::Railtie.insert
        end
      end
    end
  end

  class Railtie
    def self.insert
      if defined?(::ActiveRecord)
        ::ActiveRecord::Base.extend(Model::ActiveRecord)
      end
    end
  end
end