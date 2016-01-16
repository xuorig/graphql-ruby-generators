<%= @name %>Type = GraphQL::ObjectType.define do
  name '<%= @name %>'
  description '<%= @description %>'
<% @fields.each do |field| -%>
  <%= field %>
<% end -%>
end
