# dylib link demo

A demo to show how to build and run a Rust based program depending on a Rust library which needs a C shared library.

## Quick Test

1. `make oldadd`: this create a C shared library called `libadd.so` in ./demo
2. `make build`: build the Rust project by adding linker arguments by `-C`. Should create the executable successfully.
3. `make copy`: copy executable and library file into `test_dir ` to create a test environment
4. `make dir_test`: run the program with `LD_LIBRARY_PATH=./lib`. Should be successful. output: `c_add_foo: 1`
5. `make newadd`: create a new shared library using newadd.cxx
6. `make copy_new`: copy the library to the target position
7. `make dir_test`: output: `c_add_foo: 2`. The program loads the correct shared library.
