// The 'big_transition' program.
program big_transition.aleo {
    transition main() -> (
        public [[[u16; 32]; 32]; 16],
        public [[[u16; 32]; 32]; 16],
        public [[[u16; 32]; 32]; 16],
        public [[[u16; 32]; 32]; 16],
        public [[[u16; 32]; 32]; 16],
        public [[[u16; 32]; 32]; 16],
        public [[[u16; 32]; 32]; 16],
        public [[[u16; 32]; 32]; 16],
        public [[[u16; 32]; 32]; 16],
        public [[[u16; 32]; 32]; 16],
        public [[[u16; 32]; 32]; 16],
        public [[[u16; 32]; 32]; 16],
        public [[[u16; 32]; 32]; 16],
        public [[[u16; 32]; 32]; 16],
        public [[[u16; 32]; 32]; 16],
        public [[[u16; 32]; 32]; 16]    
    ) {
        // Construct a base array.
        let base: [u16; 32] = [
            0u16, 0u16, 0u16, 0u16, 0u16, 0u16, 0u16, 0u16,
            0u16, 0u16, 0u16, 0u16, 0u16, 0u16, 0u16, 0u16,
            0u16, 0u16, 0u16, 0u16, 0u16, 0u16, 0u16, 0u16,
            0u16, 0u16, 0u16, 0u16, 0u16, 0u16, 0u16, 0u16,
        ];
        let next: [[u16; 32]; 32] = [
            base, base, base, base, base, base, base, base,
            base, base, base, base, base, base, base, base,
            base, base, base, base, base, base, base, base,
            base, base, base, base, base, base, base, base
        ];
        let one: [[[u16; 32]; 32]; 16] = [next, next, next, next, next, next, next, next, next, next, next, next, next, next, next, next];
        let two: [[[u16; 32]; 32]; 16] = [next, next, next, next, next, next, next, next, next, next, next, next, next, next, next, next];
        let three: [[[u16; 32]; 32]; 16] = [next, next, next, next, next, next, next, next, next, next, next, next, next, next, next, next];
        let four: [[[u16; 32]; 32]; 16] = [next, next, next, next, next, next, next, next, next, next, next, next, next, next, next, next];
        let five: [[[u16; 32]; 32]; 16] = [next, next, next, next, next, next, next, next, next, next, next, next, next, next, next, next];
        let six: [[[u16; 32]; 32]; 16] = [next, next, next, next, next, next, next, next, next, next, next, next, next, next, next, next];
        let seven: [[[u16; 32]; 32]; 16] = [next, next, next, next, next, next, next, next, next, next, next, next, next, next, next, next];
        let eight: [[[u16; 32]; 32]; 16] = [next, next, next, next, next, next, next, next, next, next, next, next, next, next, next, next];
        let nine: [[[u16; 32]; 32]; 16] = [next, next, next, next, next, next, next, next, next, next, next, next, next, next, next, next];
        let ten: [[[u16; 32]; 32]; 16] = [next, next, next, next, next, next, next, next, next, next, next, next, next, next, next, next];
        let eleven: [[[u16; 32]; 32]; 16] = [next, next, next, next, next, next, next, next, next, next, next, next, next, next, next, next];
        let twelve: [[[u16; 32]; 32]; 16] = [next, next, next, next, next, next, next, next, next, next, next, next, next, next, next, next];
        let thirteen: [[[u16; 32]; 32]; 16] = [next, next, next, next, next, next, next, next, next, next, next, next, next, next, next, next];
        let fourteen: [[[u16; 32]; 32]; 16] = [next, next, next, next, next, next, next, next, next, next, next, next, next, next, next, next];
        let fifteen: [[[u16; 32]; 32]; 16] = [next, next, next, next, next, next, next, next, next, next, next, next, next, next, next, next];
        let sixteen: [[[u16; 32]; 32]; 16] = [next, next, next, next, next, next, next, next, next, next, next, next, next, next, next, next];
        return (one, two, three, four, five, six, seven, eight, nine, ten, eleven, twelve, thirteen, fourteen, fifteen, sixteen);
    }
}
        