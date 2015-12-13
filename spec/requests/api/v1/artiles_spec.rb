require 'rails_helper'
require 'pry-rails'

RSpec.describe 'Articles', type: :request do
  describe 'GET /api/v1/articles/show' do
    let(:path) { '/api/v1/articles/show' }
    before do
      @article = create(:article)
      get path, id: @article.id
    end

    it '200が返ってくる' do
      expect(response).to be_success
      expect(response.status).to eq 200
    end

    it '取得データの構造は正しいこと' do
      @json = JSON.parse(response.body)
      expect(@json['id']).to eq @article.id
      expect(@json['created_at']).to eq @article.created_at.as_json
      expect(@json['updated_at']).to eq @article.updated_at.as_json

      expect(@json['title']).to eq @article.title
      expect(@json['text']).to eq @article.text
    end
  end

  describe 'GET /api/v1/articles' do
    let(:path) { '/api/v1/articles' }
    before do
      @articles = create_list(:article, 5)
      get path
    end

    it '一覧の取得' do
      @json = JSON.parse(response.body)
      expect(@json.size).to eq @articles.count
      expect(@json[0]['id']).to eq @articles[0].id
    end
  end

  describe 'GET /api/v1/articles/recent' do
    let(:path) { '/api/v1/articles/recent' }
    before do
      @articles = create_list(:article, 10)
      @recent_articles = @articles.reverse[0..4]
      get path
    end

    it '最新から取ってきている' do
      @json = JSON.parse(response.body)
      expect(@json[0]['id']).to eq @recent_articles[0].id
      expect(@json[4]['id']).to eq @recent_articles[4].id
    end
  end
end
