module Entity
  module V1
    class UserDetailEntity < UserEntity
      expose :recent_articles, using: ArticleEntity do |user|
        user.articles.recently_create
      end
    end
  end
end
