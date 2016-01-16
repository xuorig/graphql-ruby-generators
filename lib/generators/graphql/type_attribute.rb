require 'rails/generators/named_base'

module Graphql
  module Generators
    class TypeAttribute
      REQUIRED = 'required'
      REQUIRED_BANG = '!'
      SCALAR_TYPES = %w(String Int Boolean Id Float)

      class << self
        def parse(attribute)
          name, type, required = attribute.split(':')
          self.new(
            name,
            parse_type(type),
            required,
            type_is_list?(type)
          )
        end

        private

        def parse_type(type)
          return type unless type_is_list?(type)
          type[1..-2]
        end

        def type_is_list?(type)
          type =~ /^\[.*\]$/
        end
      end

      def initialize(name, type, required, is_list)
        @name = name
        @type = type
        @required = required
        @is_list = is_list
      end

      def generate_field_line
        "field :#{@name}, #{type_definition}"
      end

      private

      def type_definition
        definition = list? ? list_type_definition : single_type_definition
        definition.prepend(REQUIRED_BANG) if required?
        definition
      end

      def single_type_definition
        SCALAR_TYPES.include?(@type) ? "types.#{@type}" : @type
      end

      def list_type_definition
        SCALAR_TYPES.include?(@type) ? "types[types.#{@type}]" : "types[#{@type}]"
      end

      def required?
        @required
      end

      def list?
        @is_list
      end
    end
  end
end
