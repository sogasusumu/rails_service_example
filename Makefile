security_checker:
	brakeman -A -f html -o security-check.html

test:
	bundle exec rails spec

linter:
	bundle exec rubocop
	rails_best_practices .

pre_commit:
	security_checker
	linter
