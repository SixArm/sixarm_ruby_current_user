Gem::Specification.new do |s|

  s.name              = "sixarm_ruby_current_user"
  s.summary           = "SixArm Ruby Gem: Ruby On Rails methods to get and set a user in a session"
  s.version           = "1.2.6"
  s.author            = "SixArm"
  s.email             = "sixarm@sixarm.com"
  s.homepage          = "http://sixarm.com/"
  s.signing_key       = '/home/sixarm/keys/certs/sixarm.com.rsa.private.key.and.certificate.pem'
  s.cert_chain        = ['/home/sixarm/keys/certs/sixarm.pem']

  s.platform          = Gem::Platform::RUBY
  s.require_path      = 'lib'
  s.has_rdoc          = true
  s.files             = ['README.rdoc','LICENSE.txt','lib/sixarm_ruby_current_user.rb']
  s.test_files        = ['test/sixarm_ruby_current_user_test.rb']

  s.add_dependency('sixarm_ruby_current_user_id', '>= 1.2.6')  
  s.add_dependency('sixarm_ruby_active_record_mock', '>= 1.2.1') #test/unit

end