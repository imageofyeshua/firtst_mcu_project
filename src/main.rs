#![no_std]
#![no_main]
#![allow(clippy::empty_loop)]
#![allow(unused_variables, dead_code)]

use core::panic::PanicInfo;

mod startup_stm32f103;

/* global array */
static mut SCORES_GLOBAL: [i32; 5] = [1, 2, 3, 4, 5];
const NUMBERS: [i32; 5] = [1, 2, 3, 4, 5];
static mut BUFFER: [u8; 1024] = [0; 1024];

#[unsafe(no_mangle)]
fn main() {

    let mut total_score = 0;

    unsafe {
        for score in SCORES_GLOBAL {
            total_score += score;
        }
    }

    unsafe {
        BUFFER[0] = 100;
    }

    loop {

    }
}

#[panic_handler]
fn panic_handler(_info: &PanicInfo) -> ! {
    loop {

    }
}
