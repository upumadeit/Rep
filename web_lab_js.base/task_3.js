const students = [
    {name: 'Анна', grade: 5},
    {name: 'Егор', grade: 3},
    {name: 'Влад', grade: 4},
    {name: 'Мария', grade: 4},
    {name: 'Виктор', grade: 3}
];

const mingrade = 3;

for (let student of students) {
    if (student.grade > mingrade) {
        console.log(student.name + ' - ' + student.grade);
    }
}

let sum = 0;
for (let student of students) {
    sum += student.grade;
}
const average = sum / students.length;
console.log('Средняя оценка: ' + average);
