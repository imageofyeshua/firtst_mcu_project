// main.rs or lib.rs
#![no_std]
#![no_main]
#![feature(custom_test_frameworks)]
#![test_runner(crate::test_runner)]
#![reexport_test_harness_main = "test_main"]

use core::panic::PanicInfo;

#[panic_handler]
fn panic(_info: &PanicInfo) -> ! {
    loop {}
}

// Custom test runner
pub fn test_runner(tests: &[&dyn Fn()]) {
    // Run your tests here
    for test in tests {
        test();
    }
}

#[test_case]
fn test_example() {
    assert_eq!(1 + 1, 2);
}
