require 'rails_helper'
include RandomData

RSpec.describe Favorite, type: :model do
  let(:topic) { Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph) }
  let(:user) { User.create!(name: "Bloccit User", email: "user@bloccit.com", password: "helloworld") }
  let(:post) { topic.post.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, user: user) }
  let(:favorites) { Favorite.create!(post: post, user: user) }
  
  it { should belong_to(:post) }
  it { should belong_to(:user) }
  
end
