require 'rails_helper'
include RandomData

RSpec.describe SponsoredPosts do
   
  let (:my_topic) { Topic.create!(name:  RandomData.random_sentence, description: RandomData.random_paragraph) }
  let (:my_sponpost) { my_topic.sponsored_posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph) }

  SponsoredPost.create(
    id:
    title: RandomData.random_sentence,
    copy: RandomData.random_paragraph,
    price: 
    )
  end
  
  describe "GET #show" do
    it "returns http success" do
      get :show, topic_id: my_topic.id, id: my_sponpost.id
      expect(response).to have_http_status(:success)
    end
    
    it "renders the #show view" do
      get :show, topic_id: my_topic.id, id: my_sponpost.id
      expect(response).to render_template :show
    end
    
    it "assigns my_sponpost to @sponsored_post" do
      get :show, topic_id: my_sponpost.id, id: my_sponpost.id
      expect(assigns(:sponsored_post)).to eq(my_sponpost)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new, topic_id: my_topic.id
      expect(response).to have_http_status(:success)
    end
    
    it "renders the #new view" do
      get :new, topic_id: my_topic.id
      expect(response).to render_template :new
    end
    
    it "initializes @sponsored_post" do
      get :new, topic_id: my_topic.id
      expect(assigns(:sponsored_post)).not_to be_nil
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, {id: my_sponpost.id}
      expect(response).to have_http_status(:success)
    end
    
    it "renders the #edit view" do
      get :edit, topic_id: my_topic.id, id: my_sponpost.id
      expect(response).to render_template :edit
    end
    
    it "assigns sponsored_post to be updated to @sponsored_post" do
      get :edit, topic_id: my_topic.id, id: my_sponpost.id
      sponsored_post_instance = assigns(:sponsored_post)
      
      expect(sponsored_post_instance.id).to eq my_sponpost.id
      expect(sponsored_post_instance.title).to eq my_sponpost.title
      expect(sponsored_post_instance.body).to eq my_sponpost.body
    end
  end
end
