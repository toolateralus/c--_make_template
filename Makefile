CXX := clang++
CXXFLAGS := -std=c++2b -Iinclude

SRC_DIR := src
OBJ_DIR := obj
BIN_DIR := bin
PROGRAM := sb

SRCS := $(wildcard $(SRC_DIR)/*.cpp)

OBJS := $(patsubst $(SRC_DIR)/%.cpp,$(OBJ_DIR)/%.o,$(SRCS))

all: $(BIN_DIR)/$(PROGRAM)

$(BIN_DIR)/$(PROGRAM): $(OBJS)
	$(CXX) $(CXXFLAGS) $^ -o $@

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp
	@mkdir -p $(BIN_DIR)
	@mkdir -p $(OBJ_DIR)
	$(CXX) $(CXXFLAGS) -c $< -o $@

clean: 
	@rm -rf $(OBJ_DIR)
	@rm -rf $(BIN_DIR)
	
run: 
	make all
	@./$(BIN_DIR)/$(PROGRAM)

refresh:
	make clean
	bear -- make

.PHONY: all