
vpath %.c src

OBJS := $(patsubst %.c,%.o,$(notdir $(wildcard src/*.c)))
TARGET := cicd

CPPFLAGS := -Iinclude $(CPPFLAGS)

all: $(TARGET)

$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) -o $@ $^ $(LIBS)

%.o: %.c
	$(CC) $(CFLAGS) $(CPPFLAGS) -c -o $@ $^

test: $(TARGET)
	@echo "TODO: Testing not yet implemented..."
	./$(TARGET)

.PHONY: clean
clean:
	rm -f $(OBJS) $(TARGET)
