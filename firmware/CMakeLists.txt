cmake_minimum_required(VERSION 3.20)

project(rt-flight-node C ASM)

add_executable(rt-flight-node
    Core/main.c
    Core/startup_stm32f4.s
)

target_compile_options(rt-flight-node PRIVATE
    -mcpu=cortex-m4
    -mthumb
    -ffreestanding
)

target_link_options(rt-flight-node PRIVATE
    -mcpu=cortex-m4
    -mthumb
    -nostdlib
    -T${CMAKE_CURRENT_SOURCE_DIR}/STM32F407VGTx_FLASH.ld
    -Wl,-Map=${CMAKE_CURRENT_BINARY_DIR}/rt-flight-node.map
)

set_target_properties(rt-flight-node PROPERTIES
    SUFFIX ".elf"
)

set_property(
    TARGET rt-flight-node
    APPEND
    PROPERTY LINK_DEPENDS
    ${CMAKE_CURRENT_SOURCE_DIR}/STM32F407VGTx_FLASH.ld
)