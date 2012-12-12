require 'linkify'

module Linkify

  ##
  # Methods for invoking Linky in a model.
  #
  module Model
    module Base
      def linky_options
        if defined?(@linky_options)
          @linky_options
        elsif superclass.respond_to?(:linky_options)
          superclass.linky_options || { }
        else
          { }
        end
      end

      def linkable_by
        fail
      end

      def linkable
        linky_options[:linkable]
      end
      
      def linkable_title
        linky_options[:user_title]
      end
      
      def linkable_path
        linky_options[:user_path]
      end
      
      def linkable_method
        linky_options[:finder_method]
      end
      
      def linkable_records
        if linkable_method == :all
          all
        else
          linkable_method
        end
      end
      
    private

      def linkable_init(options)
        unless @linky_options
          @linky_options = {}
        end
        @linky_options.merge! options
      end
    end
  end
end
