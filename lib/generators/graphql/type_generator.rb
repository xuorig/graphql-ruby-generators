require 'generators/graphql/base_type_generator'
require 'generators/graphql/type_attribute'

module Graphql
  module Generators
    class TypeGenerator < BaseTypeGenerator
      source_root ::File.expand_path('../templates', __FILE__)

      desc 'Generates a GraphQL Type for a given Model'

      argument :name,
               type: :string
      argument :description,
               type: :string,
               default: 'Description',
               banner: "description"
      argument :attributes,
               type: :array,
               default: [],
               banner: 'attribute[:type]'

      REQUIRED = 'required'

      def generate_type
        fields = field_lines
        create_type_file(
          name.camelize,
          description,
          fields
        )
      end

      private

      def field_lines
        parsed_attributes.map { |parser| parser.generate_field_line }
      end

      def parsed_attributes
        attributes.map { |attribute|
          TypeAttribute.parse(attribute)
        }
      end
    end
  end
end
