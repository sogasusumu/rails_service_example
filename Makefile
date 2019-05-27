security_checker:
	brakeman -A -f html -o security-check.html

linter:
	bundle exec rubocop -a
	rails_best_practices .

pre_commit:
	security_checker
	linter
