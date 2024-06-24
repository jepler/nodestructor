# Demo of removing global destructors

I don't know if this even works (I didn't run it on HW or anything)

Theory:

With -fno-use-cxa-atexit, an older technique of putting lists of finalizers in the ".fini.array" section is used.

If this section is removed from each object file, and functions and data are sectioned, and sections are garbage collected by the linker, and the destructor is otherwise unused, its related code is not placed in the final binary.

This can be seen by the fact that the `yon-mod` program produced is over 500 bytes shorter than the regular one.

# Status

This was just a demonstration of the concept, put on github so I could easily
share it. It is not and will not be maintained.

# License

Public domain. At your option, any of the following: CC-0, MIT, LGPL-2.1-or-later, GNU All-Permissive. But seriously you're just going to study this and maybe take an idea from it in your own software so who cares.
