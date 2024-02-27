IDIR = ../include
CC = gcc
CFLAGS = -I$(IDIR) -MMD -MP
ODIR = obj
LDIR = ../lib

_DEPS = common.h chunk.h debug.h memory.h
DEPS = $(patsubst %,$(IDIR)/%,$(_DEPS))

_OBJ = main.o chunk.o debug.o memory.o
OBJ = $(patsubst %,$(ODIR)/%,$(_OBJ))

$(ODIR)/%.o: src/%.c | $(ODIR)
	$(CC) -c -o $@ $< $(CFLAGS)

$(ODIR):
	mkdir -p $(ODIR)

main: $(OBJ)
	$(CC) -o $@ $^ $(CFLAGS)

.PHONY: clean

clean:
	rm -f $(ODIR)/*.o $(ODIR)/*.d *~ core $(IDIR)/*~

# Ensure that the dependency directories are created before compiling
-include $(OBJ:.o=.d)
