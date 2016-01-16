require 'generators/graphql/base_type_generator'

module Graphql
  module Generators
    class AllTypesGenerator < BaseTypeGenerator
      desc 'Creates GraphQL types for all ActiveRecord models'

      TYPE_FOR_COLUMN = {
        integer: 'Int',
        string: 'String',
        float: 'FLoat',
        boolean: 'Boolean'
      }

      def create_all_types
        models.each do |model|
          fields = model.columns.map { |column|
            name = column.name
            type = TYPE_FOR_COLUMN[column.type] ||
                    field.type.to_s.camelize
            "field #{name}, types.#{type}"
          }
          create_type_file(
            model.name,
            "Todo: Describe #{model.name}",
            fields
          )
        end
      end

      private

      def field_definitions

      end

      def models
        Rails.application.eager_load! unless Rails.configuration.cache_classes
        ActiveRecord::Base.descendants
      end
    end
  end
end
