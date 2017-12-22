class EpicenterController < ApplicationController
  def Feed
  	 @following_tweets = []

    Tweet.all.each do |tweet|
      if current_user.following.include?(tweet.user_id) 
        || current_user.id == tweet.user_id
        @following_tweets.push(tweet)
  end
  def all_users
  	@users = User.all
  def show_user
  	  @user = User.find(params[:id])

  end
  def following
    @user = User.find(params[:id])
    @users = []

    User.all.each do |user|
      if @user.following.include?(user.id)
        @users.push(user)
  end
  end
  end

  def followers
    @user =  User.find(params[:id])
    @users = []

    User.all.each do |user|
      if user.following.include?(@user.id)
        @users.push(user)
  end
  end
  end

  def now_following
  	current_user.following.delete(params[:id].to_i)
  current_user.save

  redirect_to show_user_path(id: params[:id])  	
  end
  end
  def tag_tweets
    @tag = Tag.find(params[:id])
  end

  def unfollow
  end
  <div class="row">
  <% @users.each do |user| %>
    <div class="col-md-3">
      <div class="well user-list-wells">
        <div class="row">
          <div class="col-md-6">
            <%= image_tag user.avatar.url, class: "user-pic-md" %>
          </div>
          <div class="col-md-6">
            <p>
              <% if current_user.following.include?(user.id) %>
                <%= link_to "Following", unfollow_path(id: user.id), class: "btn btn-primary", id: "unfollow_btn" %>
              <% else %>
                <% if current_user.id != user.id %>
                  <%= link_to "Follow", now_following_path(id: user.id), class: "btn btn-primary" %>
                <% end %>
              <% end %>
            </p>
          </div>
        </div>
        <div class="row">
          <%= link_to show_user_path(id: user.id) do %>
            <h3><%= user.name %></h3>
            <p>@<%= user.username %></p>
          <% end %>
          <p>
            <%= user.bio %>
          </p>
        </div>
      </div>
    </div>
  <% end %>
</div>end
