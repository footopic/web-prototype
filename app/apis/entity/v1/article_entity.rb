module Entity
  module V1
    class ArticleEntity < BaseEntity
      expose :title
      expose :text
      expose :user, using: UserEntity
    end
  end
end
