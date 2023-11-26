# Basics
**RAM:** Faster to read and write, looses data when power down  
**ROM:** Non-volatile, permanent memory that can only be read, not written to. (Hard disk is not ROM) ROM chips are different
- BIOS is stored in ROM chip

**Bootloader:** Is a small program that is responsible for loading the kernel of an Operating System
- eg- Linux's bootloader is **grub**
### The Boot Process
- The BIOS is executed directly from ROM
- The BIOS loads the bootloader into address 0x7C00 
- The bootloader loads the kernel

#### Little and big Edian: 
Intel Processors are **Little Endian**  
In computing, endianness is the order or sequence of bytes of a word of digital data in computer memory or data communication which is identified by describing the impact of the "first" bytes, meaning at the smallest address or sent first.

#### Boot Sector:
the area on a hard disk and floppy disks containing instructions that are executed during the boot process,

#### Boot Signature (Magic Number) (0x55AA)
A sector must have a very specific disk signature to be seen by BIOS as a boot sector. This signature is 0x55AA and is contained in its very last two bytes of information. 

# Assembly Basics
[Interupt list](https://www.ctyme.com/rbrown.htm)  
[NASM - The Netwide Assembler Docs](https://www.nasm.us/xdoc/2.16.01/html/nasmdoc0.html)  

## Instruction Set

1. lodsb : Loads the data present at memory DS:SI into AX Register
1. 
# MicroProcessor x86-64 Basics
### Segmentation Memory Model
A segmented memory model divides the system memory into groups of independent segments referenced by pointers located in the segment registers. Each segment is used to contain a specific type of data. One segment is used to contain instruction codes, another segment stores the data elements, and a third segment keeps the program stack. 
#### Absoulte Memory Address Calculation
Absolute_Memeory_Address = Segment_address * 0x10 (or 16 in decimal) + offset

**Example:**  
CS = 0x7c0
Assembly origin "ORG" in 0   (offset) 
So, the absolute memory address of the first instruction = 0x7c0 * 0x10 + 0   
= 0x7c00
## Registers (16-bit)
[Good Resource of Registers (32-bit and 64-bit)](https://eecg.utoronto.ca/~amza/www.mindsec.com/files/x86regs.html)
#### General Registers
**AX, BX, CX, DX (all have high and low registers of 8-bit xH+xL)**

#### Segment Registers
**CS (Code Segement):** where the executable program is stored.  
**SS (Stack Segement):** The stack segment is that segment of memory which is used to store stack data.   
**DS (Data Segement):** points to the data segment of the memory where the data is stored.  
**ES (Extra Segement), FS, GS:** also refers to a segment in the memory which is another data segment in the memory.  

#### Index and Pointer Registers
**IP (index pointer):** Holds the offset of the next instruction  
**SI (Source Index):** Used for string and memory array copying  
**DI (Destination Index):** Used for string, memory array copying and setting and for far pointer addressing with ES  
**BP (Stack Base pointer):** Holds the base address of the stack  
**SP (Stack Pointer):** Holds the top address of the stack  

## The EFLAGS register (32-bit)
The EFLAGS register hold the state of the processor. It is modified by many intructions and is used for comparing some parameters, conditional loops and conditionnal jumps. Each bit holds the state of specific parameter of the last instruction  
[For Details refer to this link](https://eecg.utoronto.ca/~amza/www.mindsec.com/files/x86regs.html)
# Real mode development
**Real Mode:**  
- Real Mode is a simplistic 16-bit mode that is present on all x86 processors. Real Mode was the first x86 mode design and was used by many early operating systems before the birth of Protected Mode. For compatibility purposes, all x86 processors begin execution in Real Mode.
- 1 MB of RAM is available for use.
- There is no hardware-based memory protection (GDT), nor virtual memory.
- There is no built in security mechanisms to protect against buggy or malicious applications.
- The default CPU operand length is only 16 bits.
- The memory addressing modes provided are more restrictive than other CPU modes.
- Accessing more than 64k requires the use of segment register that are difficult to work with.
- The BIOS installs device drivers to control devices and handle interrupt.
- BIOS functions provide operating systems with a advanced collection of low level API functions.
- Memory access is faster due to the lack of descriptor tables to check and smaller registers.  
