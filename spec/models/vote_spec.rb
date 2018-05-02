require 'rails_helper'

RSpec.describe Vote, type: :model do
  let(:topic) { Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph) }
  let(:user) { User.create!(name: "Bloccit User", email: "user@bloccit.com", password: "helloword") }
  let(:post) { topic.posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, user: user) }
  let(:vote) { Vote.create!(value: 1, post: post, user: user) }

  it { is_expected.to belong_to(:post) }
  it { is_expected.to belong_to(:user) }
  it { is_expected.to validate_presence_of(:value) }
  it { is_expected.to validate_inclusion_of(:value).in_array([-1, 1]) }

  describe "updatate_post callback" do
    it "triggers updatate_post on save" do
      expect(vote).to receive(:update_post).at_least(:once)
      vote.save!
    end

    it "#updatate_post should call update_rank on post" do
      expect(post).to receive(:update_rank).at_least(:once)
      vote.save!
    end
  end

  describe "create_vote" do
    it "sets the post up_votes to 1" do
      expect(post.up_votes).to eq(1)
    end

    it "calls create_vote when a post is created" do
      post = topic.posts.new(title: RandomData.random_sentence, body: RandomData.random_paragraph, user: user)
      expect(post).to receive(:create_vote)
      post.save
    end

    it "associates the vote with the owner of the post" do
      expect(post.votes.first.user).to eq(post.user)
    end
  end
end
