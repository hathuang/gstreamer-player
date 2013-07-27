CC = gcc
CFLAGS += -Wall $(pkg-config --cflags --libs gstreamer-0.10)
CFLAGS += -I/usr/include/gstreamer-0.10/
CFLAGS += -I/usr/include/glib-2.0/
CFLAGS += -I/usr/include/libxml2/
CFLAGS += -I/usr/lib/i386-linux-gnu/glib-2.0/include/
CFLAGS += -O2

LDLIB += -lgstreamer-0.10
LDLIB += -L/usr/lib/glib-2.0
LDLIB += -L/usr/lib/libxml++-2.6
LDLIB += -L/usr/lib/gstreamer-0.10
OBJ = main.o

%.o: %.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS) $(LDLIB)
Gplayer: $(OBJ)
	$(CC) -o $@ $^ $(CFLAGS) $(LDLIB)

.PHONY: clean

clean:
	rm -f *.o *~ Gplayer
