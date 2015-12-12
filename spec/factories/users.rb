# == Schema Information
#
# Table name: users
#
#  id          :integer          not null, primary key
#  provider    :string           default(""), not null
#  uid         :string           not null
#  screen_name :string           default(""), not null
#  name        :string           default(""), not null
#  image       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_users_on_provider_and_uid  (provider,uid) UNIQUE
#  index_users_on_screen_name       (screen_name) UNIQUE
#

FactoryGirl.define do
  factory :user do
    uid '12345678'
    provider 'google_oauth2'
    screen_name 'eri'
    name 'エリザベート・バートリー'
    image File.open(File.join(Rails.root, 'spec/factories/sample.jpg'))
  end
end
