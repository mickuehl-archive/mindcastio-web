<%= f.input :page, as: :hidden, input_html: { value: "1"} %>

<%= javascript_tag do %>window.google_analytics_id = <%= Mindcastio::Application.config.google_analytics_id %>;<% end %>

<%= javascript_tag do %>window.google_analytics_id = 'UA-XXX';<% end %>
