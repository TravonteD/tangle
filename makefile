tangle: README.md
	./tangle $^ tangle.new sh
	mv tangle.new tangle
	chmod u+x tangle
