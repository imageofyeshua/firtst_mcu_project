MEMORY
{
    FLASH (rx)    : ORIGIN = 0x08000000, LENGTH = 64K
    RAM (rwx)     : ORIGIN = 0x20000000, LENGTH = 20K
    // EEPROM (rwx)  : ORIGIN = 0x08080000, LENGTH = 4K
    // CCMRAM (rwx)  : ORIGIN = 0x10000000, LENGTH = 64K
    // BATTRAM (rw)  : ORIGIN = 0x40024000, LENGTH = 4K  /* Battery backed RAM */
}

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
    /* here you should collect all executable code */
    *(.text)
    *(.text*)
  } > FLASH

  /* constant data will go into FLASH */
  .rodata :
  {
    *(.rodata)
    *(.rodata*)
  } > FLASH

  /* initialized data will be in FLASH and it will also be in RAM during runtime */
  .data :
  {
    _sdata = .; /* start of data section in VMA(RAM) : Virtual Memory Address >> where the section is loaded at runtime */
    *(.data)
    *(.data*)
    _edata = .;
  } > RAM AT> FLASH 
  /* FLASH also called LMA(RAM) : Load Memory Address 
  * >> where the section is stored before being copied to RAM during startup 
  */

  /* un-initialized data will be in RAM */
  .bss :
  {
    _sbss = .;
    *(.bss)
    *(.bss*)
    _ebss = .;
  } > RAM

}
