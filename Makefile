LIB = libballistics.a
EXE = ballistics_demo

SRC_DIR = src
OBJ_DIR = obj

SRC = $(wildcard $(SRC_DIR)/*.c)
OBJ = $(SRC:$(SRC_DIR)/_%.c=$(OBJ_DIR)/%.o)

CC = gcc
CPPFLAGS += -Iinclude
CFLAGS += -Wall
LDFLAGS += -L. -lm

.PHONY: all clean

all: $(LIB)

$(LIB): $(OBJ)
	ar -rcs libballistics.a $^

$(OBJ_DIR)/%.o: $(SRC_DIR)/_%.c
	$(CC) $(CPPFLAGS) $(CFLAGS) -c $< -o $@

$(EXE): $(LIB) example.c
	$(CC) $(CPPFLAGS) $(CFLAGS) -o $@ example.c $(LDFLAGS) -lballistics

clean:
	$(RM) $(OBJ) $(LIB) $(EXE)
