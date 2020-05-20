
vpath %.c src

OBJS := $(patsubst %.c,%.o,$(notdir $(wildcard src/*.c)))
TARGET := cicd

CPPFLAGS := -Iinclude $(CPPFLAGS)

all: $(TARGET)

$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) -o $@ $^ $(LIBS)

%.o: %.c
	$(CC) $(CFLAGS) $(CPPFLAGS) -c -o $@ $^

.PHONY: clean
clean:
	rm -f $(OBJS) $(TARGET)
