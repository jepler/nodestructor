#define TOO_MUCH_NOP NOP64 NOP64 NOP64 NOP64
#define NOP64 NOP16 NOP16 NOP16 NOP16
#define NOP16 NOP4 NOP4 NOP4 NOP4
#define NOP4 "nop;nop;nop;nop;"

class T final {
    public:
    ~T();
};

T::~T () {
        __asm__( TOO_MUCH_NOP );
}

T t;

int main() {
}
