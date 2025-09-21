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

> cargo readobj -- -S <elf file>
> provides detailed information about each section in the ELF file

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


