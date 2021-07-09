LIB_PATH=$(CURDIR)/demo
oldadd: demo/add.hxx demo/add.cxx
	cd demo && g++ add.cxx -I. -fPIC --shared -o libadd.so

newadd: demo/add.hxx demo/new_add.cxx
	cd demo && g++ new_add.cxx -I. -fPIC --shared -o libadd.so

build: oldadd
	RUSTFLAGS="-C link-args=-L$(LIB_PATH) -ladd" cargo build

copy: build oldadd
	cp -f target/debug/dylib_link_demo ./test_dir/bin
	mv -f demo/libadd.so ./test_dir/lib

copy_new: newadd
	mv -f demo/libadd.so ./test_dir/lib

dir_test:
	cd test_dir && LD_LIBRARY_PATH=./lib ./bin/dylib_link_demo

clean:
	cargo clean
