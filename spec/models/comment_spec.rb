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

require 'rails_helper'

RSpec.describe Comment, type: :model do

  describe 'associations' do
    it { is_expected.to belong_to(:article) }
    it { is_expected.to belong_to(:user) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:text) }
    it { is_expected.to validate_presence_of(:user) }
    it { is_expected.to validate_presence_of(:article) }
  end
end
