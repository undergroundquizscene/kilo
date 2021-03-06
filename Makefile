CFLAGS = -Wall -Wextra -pedantic -std=c17

common-objects = pane.o registers.o undo.o zipperBuffer.o editorRow.o \
          util.o fileData.o display.o $(patsubst %.c,%.o,$(wildcard lists/*.c))

test-objects = $(patsubst %.c,%.o,$(wildcard test/*.c)) $(common-objects)

main-objects = kibi.o $(common-objects)

test : $(test-objects)
	cc -o testLists $(test-objects)

kibi : $(main-objects)
	cc -o kibi $(main-objects)

kibi.o: kibi.c editorRow.h fileData.h pane.h undo.h zipperBuffer.h display.h
zipperBuffer.o: zipperBuffer.c editorRow.h
pane.o: pane.c editorRow.h util.h zipperBuffer.h fileData.h
fileData.o: fileData.c undo.h zipperBuffer.h
display.o: display.c pane.h

.PHONY : clean
clean :
	rm kibi $(objects)
