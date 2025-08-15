export async function flaky_roll() {
    // Fetch a random number from 1 to 6 with some delay. Simulate a flaky
    // network where 1 in 3 calls will fail.
    return new Promise((fulfil, reject) => {
        setTimeout(() => {
            if (Math.random() < 0.3) {
                reject(new Error("Your flaky dice flaked out on you again!"));
                return;
            }

            fulfil(Math.floor(Math.random() * 6) + 1);
        }, 1000);
    });    
}

export async function roll() {
    // Same as above but no flaky networ, this promise will never reject, always
    // fulfil.
    return new Promise((fulfil, reject) => {
        setTimeout(() => {
            fulfil(Math.floor(Math.random() * 6) + 1);
        }, 1000);
    });
}