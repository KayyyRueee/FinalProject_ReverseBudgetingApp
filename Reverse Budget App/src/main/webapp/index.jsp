<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Budgeting in Reverse</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            max-width: 700px;
            margin: 30px auto;
            padding: 20px;
            background-color: #f5f7fa;
            color: #222;
            line-height: 1.5;
        }

        h1, h2 {
            color: #245b45;
        }

        form {
            background-color: white;
            padding: 25px;
            border-radius: 10px;
        }

        label {
            display: block;
            margin-top: 15px;
            font-weight: bold;
        }

        input[type="text"], select {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            box-sizing: border-box;
        }

        .interest {
            margin: 8px 0;
        }

        .interest input {
            display: inline;
        }

        .interest label {
            display: inline;
            font-weight: normal;
            margin: 0;
        }

        button {
            margin-top: 20px;
            padding: 12px 18px;
            background-color: #245b45;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        button:hover {
            background-color: #17402f;
        }
    </style>
</head>

<body>

<h1>Budgeting in Reverse</h1>
<p>Enter your budget information to see your options.</p>

<form action="budget" method="post" onsubmit="return checkInterests()">

    <label for="username">Name or Username:</label>
    <input type="text" id="username" name="username" required>

    <h2>Select at Least 3 Interests</h2>

    <div class="interest">
        <input type="checkbox" id="pets" name="interests" value="pets">
        <label for="pets">Pets</label>
    </div>

    <div class="interest">
        <input type="checkbox" id="art" name="interests" value="art">
        <label for="art">Art</label>
    </div>

    <div class="interest">
        <input type="checkbox" id="teaching" name="interests" value="teaching">
        <label for="teaching">Teaching</label>
    </div>

    <div class="interest">
        <input type="checkbox" id="babysitting" name="interests" value="babysitting">
        <label for="babysitting">Babysitting</label>
    </div>

    <div class="interest">
        <input type="checkbox" id="handiwork" name="interests" value="handiwork">
        <label for="handiwork">Handiwork</label>
    </div>

    <div class="interest">
        <input type="checkbox" id="yardwork" name="interests" value="yardwork">
        <label for="yardwork">Yardwork</label>
    </div>

    <div class="interest">
        <input type="checkbox" id="driving" name="interests" value="driving">
        <label for="driving">Driving</label>
    </div>

    <label for="income">Monthly Income ($):</label>
    <input type="text" id="income" name="income"
           placeholder="Example: 1500" required>

    <label for="expenses">Monthly Expenses ($):</label>
    <input type="text" id="expenses" name="expenses"
           placeholder="Example: 1200" required>

    <label for="hourlyPay">Hourly Pay ($):</label>
    <input type="text" id="hourlyPay" name="hourlyPay"
           placeholder="Example: 15.00" required>

    <label for="scheduledHours">Scheduled Work Hours:</label>
    <input type="text" id="scheduledHours" name="scheduledHours"
           placeholder="Example: 5" required>

    <p>Enter the hours you are already scheduled to work.</p>

    <label for="workSchedule">How often are those hours scheduled?</label>
    <select id="workSchedule" name="workSchedule" required>
        <option value="weekly">Per Week</option>
        <option value="biweekly">Biweekly (Every Two Weeks)</option>
    </select>

    <button type="submit">Calculate My Budget</button>

</form>

<script>
    function checkInterests() {
        var selected = document.querySelectorAll(
            'input[name="interests"]:checked'
        );

        if (selected.length < 3) {
            alert("Please select at least 3 interests.");
            return false;
        }

        return true;
    }
</script>

</body>
</html>
