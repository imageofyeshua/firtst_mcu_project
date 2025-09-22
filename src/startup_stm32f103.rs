/* define the vector table for the mcu */


/* define the reset handler */
#[unsafe(no_mangle)]
fn reset_handler() {
    /* copy the .data section from FLASH to RAM */
    /* zero out the .bss section in the RAM */
    /* call main() */

    crate::main();
}


/* define the exception handlers */
