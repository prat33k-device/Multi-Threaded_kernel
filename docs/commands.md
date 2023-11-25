

**Convert the assembly file into binaries**  
```nasm -f bin ./boot.asm -o ./boot.bin```

**See the contents of bin file**  
```ndisasm boot.bin```

**To Run the bin file**  
```qemu-system-x86_64 -hda boot.bin```