#![no_std]
#![no_main]
#![allow(clippy::empty_loop)]
#![allow(unused_variables, dead_code)]

use core::panic::PanicInfo;
use led::*;
use button::*;

use crate::board::{BLUE_LED_PIN, BLUE_LED_PORT};

mod startup_stm32f103;
mod led;
mod button;
mod mcu;
mod board;

#[unsafe(no_mangle)]
fn main() {

    led_init(BLUE_LED_PORT, BLUE_LED_PIN);
    led_on(BLUE_LED_PORT, BLUE_LED_PIN);
    //button_init(BUTTON_PIN);
    //button_configure_interrupt(BUTTON_PIN);

    loop {

    }
}

#[panic_handler]
fn panic_handler(_info: &PanicInfo) -> ! {
    loop {

    }
}

// button interrupt handler
fn EXTIO_Handler() {
    led_toggle(BLUE_LED_PORT, BLUE_LED_PIN);
}
