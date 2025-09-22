ENTRY (reset_handler)

/* define memory regions */
MEMORY
{
    FLASH (rx)    : ORIGIN = 0x08000000, LENGTH = 64K
    RAM (rwx)     : ORIGIN = 0x20000000, LENGTH = 20K
    /* EEPROM (rwx)  : ORIGIN = 0x08080000, LENGTH = 4K */
    /* CCMRAM (rwx)  : ORIGIN = 0x10000000, LENGTH = 64K */
    /* BATTRAM (rw)  : ORIGIN = 0x40024000, LENGTH = 4K */
}

_start_of_stack = ORIGIN(RAM) + LENGTH(RAM);
_min_stack_size = 0x400;
_min_heap_size = 0x400;

SECTIONS
{
  /*
  * 1. defines where each program section is placed in the microcontroller's memory
  * 2. the linker assigns address based on the SECTIONS command,
  *    creating an ELF file with exact memory locations.
  *    for example, if FLASH starts at 0x08000000 and the .text section is placed in FLASH
  *    the linker will assign address starting from 0x08000000 for the .text section.
  * 3. The ELF file guies the programming tool to correctly place the SECTIONS
  *    in the microcontroller ensuring proper execution of the code
  */

  .text :
  {
    /* . = 0x0800_0000 */
    /* here you should collect all executable code */
    . = ALIGN(4); /* LOCATION COUNTER : multiple of 4 for the next address */
    *(.text)
    *(.text*) /* . ==> 0x0800_0021 */
    . = ALIGN(4); /* ==> 0x0800_0024 */
  } > FLASH

  /* constant data will go into FLASH */
  .rodata :
  {
    . = ALIGN(4);
    *(.rodata)
    *(.rodata*)
    . = ALIGN(4);
  } > FLASH

  /* initialized data will be in FLASH and it will also be in RAM during runtime */
  .data :
  {
    _sidata = LOADADDR(.data); /* this returns the FLASH (LMA) */
    . = ALIGN(4);
    _sdata = .; /* start of data section in VMA(RAM) : Virtual Memory Address >> where the section is loaded at runtime */
    *(.data)
    *(.data*)
    . = ALIGN(4);
    _edata = .;
  } > RAM AT> FLASH 
  /* FLASH also called LMA(RAM) : Load Memory Address 
  * >> where the section is stored before being copied to RAM during startup 
  */

  /* un-initialized data will be in RAM */
  .bss :
  {
    . = ALIGN(4);
    _sbss = .;
    *(.bss)
    *(.bss*)
    . = ALIGN(4);
    _ebss = .;
  } > RAM

  .ram_usage_check :
  {
    . = ALIGN(8);
    .  = . + _min_stack_size;
    .  = . + _min_heap_size;
    . = ALIGN(8);
  } > RAM

}
