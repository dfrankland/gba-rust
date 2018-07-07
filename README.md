# gba-rust

In order to learn more about the low-level aspects of Rust, I
decided to implement some simple proof-of-concept games for the
gameboy advance in Rust.

For now there is only a very simple implementation of snake.

## Prerequisites

*   [`rustup`](https://rustup.rs/)

    ```bash
    curl https://sh.rustup.rs -sSf | sh
    ```

*   Rust nightly

    ```bash
    rustup install nightly
    ```

*   Rust sources

    ```bash
    rustup component add rust-src
    ```

*   [`xargo`](https://github.com/japaric/xargo)

    ```bash
    cargo install xargo
    ```

*   `arm-none-eabi` `binutils`

    *   Mac

        ```bash
        brew cask install gcc-arm-embedded
        ```

    *   Ubuntu

        ```bash
        apt install binutils-arm-none-eabi
        ```

## Building

All that's needed is to run a small bash script.

```bash
# Debug
./build.sh

# Release
./build.sh --release
```

## Running

After building, find the `.gba` file to load into a GBA emulator in `./out`. So
far, this has been tested and works on [`mGBA`][mgba].

[mgba]: https://github.com/mgba-emu/mgba
