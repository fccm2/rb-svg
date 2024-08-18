all: e0.svg c1.svg c2.svg
%.svg: %.rb
	ruby $< > $@
clean:
	$(RM) *.svg
