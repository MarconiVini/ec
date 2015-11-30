FactoryGirl.define do
  factory :image do
    file {
      ActionDispatch::Http::UploadedFile.new(
        :tempfile => File.new("#{Rails.root}/spec/fixtures/model/product/test-image.jpg"), 
        :filename => file_name) 
    }

    transient do
      file_name "test-image.jpg"
    end
  end
end
