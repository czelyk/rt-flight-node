ENTRY(Reset_Handler)

MEMORY
{
    FLASH (rx) : ORIGIN = 0x08000000, LENGTH = 1024K
    RAM (rwx)  : ORIGIN = 0x20000000, LENGTH = 128K
}

_estack = ORIGIN(RAM) + LENGTH(RAM);

SECTIONS
{
    .isr_vector :
    {
        KEEP(*(.isr_vector))
    } > FLASH

    .text :
    {
        *(.text)
        *(.text*)
		*(.rodata)
    	*(.rodata*)
    } > FLASH

    .data :
    {
        _sdata = .;
        *(.data)
        *(.data*)
        _edata = .;
    } > RAM AT > FLASH

    _sidata = LOADADDR(.data);

    .bss :
    {
        _sbss = .;
        *(.bss)
        *(.bss*)
        _ebss = .;
    } > RAM
}

ASSERT(ADDR(.isr_vector) == ORIGIN(FLASH),
       "Vector table must start at beginning of FLASH")