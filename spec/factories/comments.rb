# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  article_id :integer          not null
#  text       :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_comments_on_article_id              (article_id)
#  index_comments_on_article_id_and_user_id  (article_id,user_id)
#  index_comments_on_user_id                 (user_id)
#  index_comments_on_user_id_and_article_id  (user_id,article_id)
#

FactoryGirl.define do
  factory :comment do
    user
    article
    text 'hoge'
  end

end
