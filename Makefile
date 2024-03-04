CC = gcc
CFLAGS = -I$(INCLUDE_DIR) -g -Wall 

SRC_DIR=src
OBJ_DIR = obj
BIN_DIR = bin
INCLUDE_DIR = ./include

TARGET = $(BIN_DIR)/main

SRCS=$(wildcard $(SRC_DIR)/*.c)
OBJS=$(patsubst $(SRC_DIR)/%.c, $(OBJ_DIR)/%.o, $(SRCS))

all:$(TARGET)

$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) -o $@

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	$(CC) $(CFLAGS) -c $< -o $@

$(OBJS): | $(OBJ_DIR)
$(TARGET): | $(BIN_DIR)

$(OBJ_DIR) $(BIN_DIR):
	mkdir -p $@

.PHONY: clean

clean:
	rm -rf $(OBJ_DIR) $(BIN_DIR)

