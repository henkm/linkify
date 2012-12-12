module Linkify
  # Contains methods to use in views and helpers.
  
  module ViewHelper
    
    
    # renders a select
    def internal_links(current_object, additional_pages=[])
      grouped_options_for_select(grouped_options(additional_pages), current_object)
    end
    
    def all_models
      list = []
      Dir.foreach("#{::Rails.root}/app/models") do |model_path|
        # only take .rb files
        if model_path[-2,2] == "rb"
          mod = model_path.gsub('.rb', '').camelize.constantize 
          list << mod if mod.linkable
        end
      end
      return list
    end
    
    def grouped_options(additional_pages)
      options = []
      # add additional pages to the list first
      pages  =[]
      for page in additional_pages
        pages << page
      end
      options << ["-", pages] if pages.any?
      # then, add records from the database
      for mod in all_models
        model_array = []
        mod.linkable_records.each do |record|
          model_array << [record.send(mod.linkable_title), [mod.to_s, record.send(mod.linkable_path)]]
        end
        options << [I18n.t("activerecord.models.#{mod.to_s.underscore}"), model_array]
      end
      return options
    end
    
   
  end
end