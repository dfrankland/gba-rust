#! /bin/bash

set -e;

# Needed for LTO by xargo / cargo
# (this is needed to use tools like clippy too)
export CARGO_INCREMENTAL=0;

# Use xargo to compile Rust core and code
if [ "$1" == "--release" ]
then
  TARGET=release;
  xargo build "$1" --target=gba;
else
  TARGET=debug;
  xargo build --target=gba;
fi

OUT_DIR=./out;
FILE_NAME="snake-$TARGET";

# Create out directory
mkdir -p $OUT_DIR;

# Compile C runtime initialization
arm-none-eabi-as -o $OUT_DIR/crt0.o ./crt0.s;

# Link C runtime initialization to Rust static lib
arm-none-eabi-ld -T ./linker.ld -o $OUT_DIR/$FILE_NAME.elf $OUT_DIR/crt0.o ./target/gba/$TARGET/libgba_snake.a;

# Convert ELF to binary for use by GBA
arm-none-eabi-objcopy -O binary $OUT_DIR/$FILE_NAME.elf $OUT_DIR/$FILE_NAME.gba;
