<%= @name %>Type = GraphQL::ObjectType.define do
  name '<%= @name %>'
  description '<%= @description %>'
<% @fields.each do |field| -%>
  field :<%= field[:name] %>, !types.<%= field[:type] %>
<% end -%>
end
