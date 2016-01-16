require 'generators/graphql/base_type_generator'

module Graphql
  module Generators
    class AllTypesGenerator < BaseTypeGenerator
      desc 'Creates GraphQL types for all ActiveRecord models'
      source_root ::File.expand_path('../templates', __FILE__)

      def create_all_types
        models.each do |model|
          fields = model.columns.map { |field|
            {
              name: field.name,
              type: TYPE_COLUMN_MAPPING[field.type] ||
                    field.type.to_s.camelize
            }
          }
          create_type_file(
            model.name,
            "description 123",
            fields
          )
        end
      end

      private

      def models
        Rails.application.eager_load! unless Rails.configuration.cache_classes
        ActiveRecord::Base.descendants
      end
    end
  end
end
