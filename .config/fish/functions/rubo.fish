function rubo
	git status --porcelain | egrep '((\\.rb)|(\\.rake))' | awk '{print $2}' | grep -v schema.rb | xargs rubocop -R -D
end
