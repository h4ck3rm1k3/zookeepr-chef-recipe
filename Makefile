bundle:
	bundle install
one :
	#bundle exec bundle exec /usr/bin/rspec --backtrace  spec/git_spec.rb
	#bundle exec bundle exec /usr/bin/rspec --backtrace  spec/postgres_spec.rb
	bundle exec bundle exec /usr/bin/rspec --backtrace  spec/first_spec.rb

rake :
	bundle exec rake > trace.txt

test_apply:
	bundle exec  chef-apply recipes/default.rb  -l debug

test2:
	bundle exec ruby test.rb
