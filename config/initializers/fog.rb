CarrierWave.configure do |config|
  #config.fog_provider = 'fog/aws'                        # required
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     'AKIAJESVXJZDSTWPF4XQ',                        # required
    aws_secret_access_key: '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',                        # required
    region:                'sa-east-1',                  # optional, defaults to 'us-east-1'
    #host:                  's3-website-sa-east-1.amazonaws.com',             # optional, defaults to nil
    #endpoint:              'http://ecmatrixbucket.s3-website-sa-east-1.amazonaws.com' # optional, defaults to nil
  }
  config.fog_directory  = 'ecmatrixbucket'                          # required
  #config.fog_public     = false                                        # optional, defaults to true
  #config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" } # optional, defaults to {}
end