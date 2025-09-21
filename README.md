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

`cargo build --target thumbv7m-none-eabi` 
`rustup target add thumbv7m-none-eabi`
`rustup component list`
