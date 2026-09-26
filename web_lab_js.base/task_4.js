function GuessNumber(guess, secret) {
    if (guess === secret) {
        return 'Угадал';
    }   else if (guess < secret) {
        return 'Число больше';
    }   else {
        return 'Число меньше';
    }
}

const secret = Math.floor(Math.random() * 10) + 1;

let guess = 0;

while (guess != secret) {
    guess = Number(prompt('Угадай число от 1 до 10'));
    console.log(GuessNumber(guess, secret));
}