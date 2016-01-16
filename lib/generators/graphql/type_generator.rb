require 'generators/graphql/base_type_generator'

module Graphql
  module Generators
    class TypeGenerator < BaseTypeGenerator
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

      def generate_type
        fields = attributes.map { |attribute|
          {
            name: attribute.name,
            type: attribute.type
          }
        }
        create_type_file(
          name.camelize,
          "Description test",
          fields
        )
      end
    end
  end
end
