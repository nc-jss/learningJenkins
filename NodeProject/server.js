const express = require('express');
const bodyParser = require('body-parser');

const app = express();
console.log("testing");

let userGoal = 'Learn Docker!';

app.use(
    bodyParser.urlencoded({
        extended: false,
    })
);

app.use(express.static('public'));

app.get('/',(req,res) =>{
    res.send(`
    <html>
        <head>
            <link rel="stylesheet" href="styles.css"></link>
        </head>
        <body>
            <section>
                <h2>My Course Goal </h2>
                <h3>${userGoal}</h3>
            </section>
            <form action="/store-goal" method="POST">
                <div class="form-control" >
                    <label>Course Goal</label>
                    <input type="text" name="goal">
                </div>
                <button>Set Goal</button>
            </form>
        </body>

    </html>`
    );
});

app.post('/store-goal',(req,res)=>{
    const enterdGoal = req.body.goal;
    console.log(enterdGoal);
    userGoal = enterdGoal;
    res.redirect('/');
});

app.listen(process.env.PORT);