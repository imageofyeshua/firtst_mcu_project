# First MCU Project

## Board: STM32F103C6T6 >> Arm Cortex-M3 : Armv7-M Architect

| ARM Cortex Mx Processor              | Architecture    |
|------------------------------------- | --------------- |
| Arm Cortex-M0: thumbv6m-none-eabi    | Armv6-M         |
| Arm Cortex-M0+: thumbv6m-none-eabi   | Armv6-M         |
| Arm Cortex-M3: thumbv7m-none-eabi    | Armv7-M         |
| Arm Cortex-M4: thumbv7em-none-eabi   | Armv7E-M        |
| Arm Cortex-M7: thumbv7em-none-eabihf | Armv7E-M        |

### *-eabi   -> Processor + No Hardward FloatingPoint Unit
### *-eabihf -> Processor + Hardward FloatingPoint Unit

```
rustup target list
cargo build --target thumbv7m-none-eabi
rustup target add thumbv7m-none-eabi
rustup component list
```

```
cd target/thumbv7m-none-eabi/debug
file <executable-file-name>
```

```
cargo install cargo-binutils
rustup component add llvm-tools-preview
```

> cargo objdump -- -h <elf file> 
> provides a high-level overview of the section in the ELF file, including their sizes and addresses

> cargo readobj -- -s <elf file> : display the symbol table
> cargo readobj -- -all <elf file> : print all details of the ELF file
> cargo readobj -- -x .data <elf file> : print the contents of each section in an ELF file

`cargo readobj -- -h thumbv7m-none-eabi`

## ELF (Executable and Linkable Format)

### ELF header : metadata about the file

### Program header : info on the segments that need to be loaded into memory

### Sections 
#### [.text] : executable code
#### [.data] : initialized data
#### [.bss] : uninitialized data
#### [.rodata] : read-only data

#### [.symtab] : symbol table
#### [.debug] : debugging info that can be used by debugger like GDB 
#### [.strtab] : string table

### Section header table : describes sections within the file

## Linker Script Commands
### MEMORY : defines memory regions available on the target device
### SECTIONS : tells the linker how input sections are mapped to output sections & placed in memory 
### ENTRY : specifies the entry point of the program
### OUTPUT :  specifies the name of the output file
### PROVIDE : defines a symbol if it is not already defined
### ASSERT : tests an assertion and stops linking if false
### KEEP : ensures that the linker retains the specified sections
### AT : specifies a different load address for a section
### ALIGN : aligns the current location to a specified boundary
### LOADADDR(section) : returns the absolute load address of the section
### SIZEOF : returns the size of a section
### ORIGIN : returns the origin address of a memory region
### LENGTH : returns the length of a memory region

```
MEMORY
{
    FLASH (rx)    : ORIGIN = 0x08000000, LENGTH = 256K
    RAM (rwx)     : ORIGIN = 0x20000000, LENGTH = 64K
    EEPROM (rwx)  : ORIGIN = 0x08080000, LENGTH = 4K
    CCMRAM (rwx)  : ORIGIN = 0x10000000, LENGTH = 64K
    BATTRAM (rw)  : ORIGIN = 0x40024000, LENGTH = 4K  /* Battery backed RAM */
}
```

```
# Build the project
cargo build --release

# Check the size of the binary
arm-none-eabi-size target/thumbv7m-none-eabi/release/first-mcu-project

# Create binary file for flashing
arm-none-eabi-objcopy -O binary target/thumbv7m-none-eabi/release/first-mcu-project

# Flash using probe-rs (supports ST-Link, J-Link, etc.)
probe-rs download --chip STM32F103C8 target/thumbv7m-none-eabi/release/first-mcu-project

# Or run directly
cargo run --release
```














