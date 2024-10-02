# Minimal Reproduction of `bin/rails spec` behaviors wrt credentials files

```
# this works
bin/rspec

# this works
env GO_BOOM=1 bin/rspec

# this works
bin/rails spec

# this does NOT work, but should!
env GO_BOOM=1 bin/rails spec

# this works
env RAILS_ENV=test GO_BOOM=1 bin/rails spec
```

The failing case yields an exception with a stacktrace like so (truncated to relevant portions):

```
** Invoke spec (first_time)
** Invoke spec:prepare (first_time)
** Invoke environment (first_time)
** Execute environment
bin/rails aborted!
ActiveSupport::MessageEncryptor::InvalidMessage: ActiveSupport::MessageEncryptor::InvalidMessage
/Users/wfarr/.gem/ruby/3.3.5/gems/activesupport-7.2.1/lib/active_support/messages/codec.rb:57:in `catch_and_raise'
/Users/wfarr/.gem/ruby/3.3.5/gems/activesupport-7.2.1/lib/active_support/message_encryptor.rb:242:in `decrypt_and_verify'
/Users/wfarr/.gem/ruby/3.3.5/gems/activesupport-7.2.1/lib/active_support/encrypted_file.rb:109:in `decrypt'
/Users/wfarr/.gem/ruby/3.3.5/gems/activesupport-7.2.1/lib/active_support/encrypted_file.rb:72:in `read'
/Users/wfarr/.gem/ruby/3.3.5/gems/activesupport-7.2.1/lib/active_support/encrypted_configuration.rb:57:in `read'
/Users/wfarr/.gem/ruby/3.3.5/gems/activesupport-7.2.1/lib/active_support/encrypted_configuration.rb:76:in `config'
/Users/wfarr/.gem/ruby/3.3.5/gems/activesupport-7.2.1/lib/active_support/encrypted_configuration.rb:95:in `options'
/Users/wfarr/.gem/ruby/3.3.5/gems/activesupport-7.2.1/lib/active_support/delegation.rb:188:in `method_missing'
/Users/wfarr/src/rspec-rails-repro/config/initializers/boom.rb:2:in `<main>'
/Users/wfarr/.gem/ruby/3.3.5/gems/railties-7.2.1/lib/rails/engine.rb:689:in `load'
/Users/wfarr/.gem/ruby/3.3.5/gems/railties-7.2.1/lib/rails/engine.rb:689:in `block in load_config_initializer'
/Users/wfarr/.gem/ruby/3.3.5/gems/activesupport-7.2.1/lib/active_support/notifications.rb:212:in `instrument'
/Users/wfarr/.gem/ruby/3.3.5/gems/railties-7.2.1/lib/rails/engine.rb:688:in `load_config_initializer'
/Users/wfarr/.gem/ruby/3.3.5/gems/railties-7.2.1/lib/rails/engine.rb:642:in `block (2 levels) in <class:Engine>'
/Users/wfarr/.gem/ruby/3.3.5/gems/railties-7.2.1/lib/rails/engine.rb:641:in `each'
/Users/wfarr/.gem/ruby/3.3.5/gems/railties-7.2.1/lib/rails/engine.rb:641:in `block in <class:Engine>'
/Users/wfarr/.gem/ruby/3.3.5/gems/railties-7.2.1/lib/rails/initializable.rb:32:in `instance_exec'
/Users/wfarr/.gem/ruby/3.3.5/gems/railties-7.2.1/lib/rails/initializable.rb:32:in `run'
/Users/wfarr/.gem/ruby/3.3.5/gems/railties-7.2.1/lib/rails/initializable.rb:61:in `block in run_initializers'
```
