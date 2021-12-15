<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Главная</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<center>
    <div>
        <h3>Поиск по номеру сотрудника</h3>
        <form action="workers_id" method="get">
            <input name="inputNum" type="number">
            <button>Подтвердить</button>
        </form>
    </div>

    <div>
        <h3>Поиск по имени сотрудника</h3>
        <form action="workers_name" method="get">
            <input name="inputName" type="text" placeholder="Иван">
            <button>Подтвердить</button>
        </form>
    </div>

    <div>
        <form action="workers_table" method="get">
            <h3>Информация о всех сотрудниках</h3>
            <button>Вывод</button>
        </form>
    </div>
</center>
</body>
</html>
