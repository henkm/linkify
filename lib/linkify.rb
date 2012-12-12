require "linkify/version"
require "linkify/models/active_record" if defined?(::ActiveRecord)
require 'linkify/view_helper'
module Linkify
  module Rails
    class Engine < ::Rails::Engine
      
    end
  end
end


ActionView::Base.send :include, Linkify::ViewHelper

if defined?(Rails)
  require "linkify/railtie"
  Linkify::Railtie.insert
end