CC = arm-none-eabi-g++ -mcpu=cortex-m0 -ffunction-sections -fdata-sections -fno-use-cxa-atexit -Os
LDFLAGS = -Wl,--gc-sections,--defsym,exit=0
.PHONY: default
default: yon yon-mod yon.s
	size yon yon-mod

clean:
	rm -f yon yon-mod yon.o yon-mod.o yon.s

yon.s: yon.cc
	$(CC) -S $< -o $@

yon.o: yon.cc
	$(CC) -c $< -o $@

yon-mod.o: yon.o
	objcopy -R .fini_array $< $@

yon: yon.o
	$(CC) $(LDFLAGS) $^ -o $@

yon-mod: yon-mod.o
	$(CC) $(LDFLAGS) $^ -o $@
