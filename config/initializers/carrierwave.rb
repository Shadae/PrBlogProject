CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',                        # required
    :aws_access_key_id      => 'AKIAIHNNTBQ5G5F5AVRQ',                        # required
    :aws_secret_access_key  => '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',                        # required
    :region                 => 'us-west-2',                  # optional, defaults to 'us-east-1'
  }
  config.fog_directory  = 'blog-vacay-project'                     # required
  #config.fog_host       = 'https://s3.amazonaws.com'
  config.fog_public     = false                                   # optional, defaults to true
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
end