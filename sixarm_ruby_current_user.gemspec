Gem::Specification.new do |s|

  s.name              = "sixarm_ruby_current_user"
  s.summary           = "SixArm.com » Ruby » CurrentUser module for Ruby On Rails to get and set a user in a session"
  s.version           = "1.3.8"
  s.author            = "SixArm"
  s.email             = "sixarm@sixarm.com"
  s.homepage          = "http://sixarm.com/"
  s.signing_key       = '/home/sixarm/keys/certs/sixarm-rsa1024-x509-private.pem'
  s.cert_chain        = ['/home/sixarm/keys/certs/sixarm-rsa1024-x509-public.pem']

  s.platform          = Gem::Platform::RUBY
  s.require_path      = 'lib'
  s.has_rdoc          = true

  top_files           = [".gemtest", "CHANGELOG.txt", "INSTALL.txt", "LICENSE.txt", "Rakefile", "README.rdoc", "VERSION"]
  lib_files           = ["lib/#{s.name}.rb"]
  test_files          = ["test/#{s.name}_test.rb"]

  s.files             = top_files + lib_files + test_files
  s.test_files        = test_files

  s.add_dependency('sixarm_ruby_current_user_id', '= 1.3.8')  
  s.add_dependency('sixarm_ruby_active_record_mock', '>= 1.4.2') # test

end