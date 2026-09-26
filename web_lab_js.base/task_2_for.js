// 2) Работа с массивом
// Дан массив:
// const numbers = [4, 8, 15, 16, 23, 42];
// Найти сумму элементов, самое большое число и создать новый массив только из чисел больше 10. Желательно сначала решить через цикл, затем через методы массивов.

const numbers = [4, 8, 15, 16, 23, 42];

let sum = 0;
let max = numbers[0];
const biggerthan10 = [];

for (let i = 0; i < numbers.length; i++) {
    sum += numbers[i];

    if (numbers[i] > max) {
        max = numbers[i];
    }

    if (numbers[i] > 10) {
        biggerthan10.push(numbers[i]);
    }
}

console.log(sum)
console.log(max)
console.log(biggerthan10)