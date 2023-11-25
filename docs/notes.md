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

# Real mode development

[Interupt list](https://www.ctyme.com/rbrown.htm)