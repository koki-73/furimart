FactoryBot.define do
  
  factory :profile do
    post_code        {"1234567"}
    tel_number       {"09012345678"}
    prefecture_id    {"1"}
    city             {"渋谷区"}
    address          {"１−１−１"}
    building         {"テストビル"}
    introduction     {"はじめまして"}
    image            { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test100.png')) }
  end

end