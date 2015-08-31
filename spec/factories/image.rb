FactoryGirl.define do
  factory :image do
    file {
      ActionDispatch::Http::UploadedFile.new(
        :tempfile => File.new("#{Rails.root}/spec/fixtures/model/product/test-image.jpg"), 
        :filename => "test-image.jpg") 
    }
  end
end
