# Lingua Franca MuJoCo Demos Makefile

# Find all .lf files in src/ (not in subdirectories)
LF_FILES := $(wildcard src/*.lf)
# Extract target names (without path and extension)
TARGETS := $(notdir $(basename $(LF_FILES)))

# Default target - show help
.PHONY: help
help:
	@echo "MuJoCo Lingua Franca Demos"
	@echo ""
	@echo "Usage:"
	@echo "  make <target>    Compile a specific demo"
	@echo "  make all         Compile all demos"
	@echo "  make clean       Remove build artifacts"
	@echo "  make help        Show this help message"
	@echo ""
	@echo "Available targets:"
	@$(foreach t,$(TARGETS),echo "  $(t)";)

# Compile all demos
.PHONY: all
all: $(TARGETS)

# Pattern rule to compile any .lf file in src/
.PHONY: $(TARGETS)
$(TARGETS): %:
	lfc src/$@.lf

# Clean build artifacts
.PHONY: clean
clean:
	rm -rf build Lingo.lock include bin src-gen fed-gen MUJOCO_LOG.TXT
