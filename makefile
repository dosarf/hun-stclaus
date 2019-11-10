# Based on http://lilypond.org/doc/v2.18/Documentation/usage/make-and-makefiles

# determine how many processors are present
CPU_CORES=`cat /proc/cpuinfo | grep -m1 "cpu cores" | sed s/".*: "//`
# The command to run lilypond
LILY_CMD=lilypond -ddelete-intermediate-files \
                    -dno-point-and-click -djob-count=$(CPU_CORES)

SOURCES := $(wildcard *.ly)
TARGETS := $(patsubst %.ly, %.pdf, $(SOURCES))

# The pattern rule to create PDF and MIDI files from a LY input file.
%.pdf %.midi: %.ly
	$(LILY_CMD) $<;

all: $(TARGETS)

clean:
	rm *.pdf *.midi

.PHONY: clean
