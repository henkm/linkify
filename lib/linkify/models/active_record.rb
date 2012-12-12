require 'linkify/models/base'

module Linkify
  module Model
    module ActiveRecord
      include Base

      ##
      # Set attribute names and include the Linky module.
      #
      def linkable_by(title, path, finder_method=:all, options = {}, &block)
        linkable_init(
          :linkable     => true,
          :user_title   => title,
          :user_path    => path,
          :finder_method => finder_method
        )
      end


      private # --------------------------------------------------------------

      def geocoder_file_name;   "active_record"; end
      def geocoder_module_name; "ActiveRecord"; end
    end
  end
end