Flickrec::Application.routes.draw do
  resources :flickrecs, only: [:index, :create, :show]
end

# <% matched_good_words = [] %>
# <% matched_bad_words = [] %>
# <% @tweets.each do |movie_title, tweets| %>
#   <% tweets.each do |tweet| %>
#     <% @good_words.each do |word| %>
#       <% if tweet.include?(word) %>
#         <% matched_good_words << word %>
#         <% @good_size = matched_good_words.count %>
#       <% end %>
#     <% end %>
#     <% @bad_words.each do |bad| %>
#       <% if tweet.include?(bad) %>
#         <% matched_bad_words << bad %>
#         <% @bad_size = matched_bad_words.count %>
#       <% end %>
#     <% end %>
#   <% end %>
#   <ul>
#     <li><%= movie_title %></li>
#     <li><%= tweets %></li>
#     <li>g:<%= matched_good_words %></li>
#     <li>b:<%= matched_bad_words %></li>
#     <li>flickrec score g: <%= @good_size %></li>
#     <li>flickrec score b: <%= @bad_size %></li>
#   </ul>
