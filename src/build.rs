//! Don't even need build.rs
use std::path::Path;
fn main() {
    let manifest_dir = std::env::var("CARGO_MANIFEST_DIR").unwrap();
    let demo_path = Path::new(&manifest_dir).join("demo");
    println!("cargo:rustc-link-search=native={}", demo_path.to_str().unwrap());
    println!("cargo:rustc-link-lib=add");
}
