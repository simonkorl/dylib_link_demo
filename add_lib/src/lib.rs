extern { fn add_foo(before: u32) -> u32; }
pub fn c_add_foo(before: u32) -> u32 {
    unsafe {
        add_foo(before)
    }
}
