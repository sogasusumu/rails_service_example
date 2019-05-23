security_checker:
	brakeman -A -f html -o security-check.html

linter:
	bundle exec rubocop -a
	rails_best_practices .

pre_commit:
	generate_openapi

generate_openapi:
	swagger-codegen generate -i docments/openapi.yml -o docments/openapi -l openapi
