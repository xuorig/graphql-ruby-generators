require 'rails/generators/named_base'

module Graphql
  module Generators
    class BaseTypeGenerator < Rails::Generators::Base
      source_root ::File.expand_path('../templates', __FILE__)

      TYPE_COLUMN_MAPPING = {
        integer: 'Int',
        string: 'String'
      }

      private

      def create_type_file(name, description, fields)
        @name = name
        @description = description
        @fields = fields
        template 'type.rb', File.join('app/graph', "#{name.underscore}_type.rb")
      end
    end
  end
end
