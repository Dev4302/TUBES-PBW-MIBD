const express = require('express');
const app = express();

app.set('view engine', 'ejs');
const port = 8080;

app.listen(port);
app.get('/' , async(req,res) =>
{
    res.render('Face1');
});

app.get('/aboutus', async(req,res)=>
{
    res.render('AboutUs!');
});

app.get('/daftarPengajar', async(req,res)=>
{
    res.render('daftarPengajar');
});

app.get('/jadwalPengajar', async(req,res)=>
{
    res.render('jadwalPengajar');
});

app.get('/Homepage-student', async(req,res)=>
{
    res.render('Homepage-student');
});

app.get('/Homepage-teacher', async(req,res)=>
{
    res.render('Homepage-teacher');
});

app.use(express.static('public'));