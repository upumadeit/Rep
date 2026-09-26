const numbers = [4, 8, 15, 16, 23, 42];

const sum = numbers.reduce((acc, num) => acc + num, 0);

const max = Math.max(...numbers);

const filtered = numbers.filter(num => num > 10);

console.log('Сумма:', sum);
console.log('Максимум:', max);
console.log('Больше 10:', filtered);