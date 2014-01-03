# Secret key encripted
secret = ENV['BLOG_KEY']
if secret.length < 30
  fail 'Secret token cannot be loaded'
else
  Blog::Application.config.secret_key_base = secret
end
