/* define the vector table for the mcu */


fn reset_handler() {
    /* copy the .data section from FLASH to RAM */
    /* zero out the .bss section in the RAM */
    /* call main() */

    create::main();
}


/* define the exception handlers */
