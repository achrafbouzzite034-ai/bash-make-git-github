README.md: guessinggame.sh makefile
	printf '# Bash, Make, Git, and GitHub\n\n' > README.md
	printf 'Make run at: %s\n\n' "$$(date '+%Y-%m-%d %H:%M:%S %Z')" >> README.md
	printf 'Lines of code in guessinggame.sh: %s\n' "$$(wc -l < guessinggame.sh | tr -d ' ')" >> README.md

.PHONY: clean
clean:
	rm -f README.md
