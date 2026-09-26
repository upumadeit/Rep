function checkNumber(number) {
    let a;
    if (number > 0) {
        a = "положительное";
    } else if (number < 0) {
        a = "отрицательное";
    } else {
        a = "ноль";
    }
    return a;

}

console.log(checkNumber(2));

function evenorodd(num) {
    let b;
    if (num % 2 === 0) {
        b = "четное";
    } else {
        b = "нечетное";
    }
    return b;
}

console.log(evenorodd(7));