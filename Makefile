LIB = libballistics.a

SRC_DIR = src
OBJ_DIR = obj

SRC = $(wildcard $(SRC_DIR)/*.c)
OBJ = $(SRC:$(SRC_DIR)/_%.c=$(OBJ_DIR)/%.o)

CPPFLAGS += -Iinclude
CFLAGS += -Wall
# LDFLAGS += -Llib
LDLIBS += -lm

.PHONY: all clean

all: $(LIB)

$(LIB): $(OBJ)
	libtool -static -o $(LIB) $^

$(OBJ_DIR)/%.o: $(SRC_DIR)/_%.c
	$(CC) $(CPPFLAGS) $(CFLAGS) -c $< -o $@

clean:
	$(RM) $(OBJ) $(LIB)

ballistics_demo: $(LIB)
	gcc example.c -o ballistics_demo -lballistics -L. -Iinclude

default: source/*.c
	gcc source/*.c -o default
