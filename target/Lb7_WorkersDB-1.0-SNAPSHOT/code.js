document.forms.findWorkerNum.onsubmit = function () {
    let inputNum = this.inputNum.value;
    parseInt(inputNum, 10);
    if (isNaN(inputNum) || inputNum == 0)
        alert("Введите число");
    else
        console.log(inputNum);
    return false;
};

let table = document.getElementById("table");
table.addEventListener('click', function (evt) {
    let confirmDelete = confirm('Подтвердите удаление');

    if (confirmDelete) {
        if (evt.target.closest('.deleteRow')) {
            evt.target.closest('tr').remove();
        }
    }
});

function outputLastNameOnTwoList() {
    let lastName = document.getElementById("inputLastName").value;
    parseInt(lastName);

    if (isNaN(lastName)) {
        localStorage.setItem("lastName", lastName);
    } else if (!isNaN(lastName)) {
        let lastNameString = prompt("Введите фамилию");
        let numOfLastName = parseInt(lastNameString);
        while (!isNaN(numOfLastName)) {
            lastNameString = prompt("Введите фамилию");
            numOfLastName = parseInt(lastNameString);
        }
        localStorage.setItem("lastName", lastNameString);
    }

    return false;
}
