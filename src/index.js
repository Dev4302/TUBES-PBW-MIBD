const express = require('express');
const app = express();

app.use(express.static('CSS'));
app.use(express.static('Script'));
app.use(express.urlencoded({extended:true}));

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
app.post('/daftarPengajar',async (req, res)=>{

    const data = req.body.username;
    console.log(data);
   
    res.redirect('/jadwalPengajar')
});


app.get('/jadwalPengajar', async(req,res)=>
{
    res.render('jadwalPengajar');
});
app.post('/jadwalPengajar',async (req, res)=>{

    const data = req.body.username;
    console.log(data);
   
    res.redirect('/optlogin');
});

app.get('/Homepage-student', async(req,res)=>
{
    res.render('Homepage-student');
});

app.get('/daftarMurid', async(req,res)=>
{
    res.render('daftarMurid');
});
app.post('/daftarMurid',async (req, res)=>{

    const data = req.body;
    console.log(data);
   
    res.redirect('/optlogin');
});

app.get('/LoginMurid', async(req,res)=>
{
    res.render('LoginMurid');
});
app.post('/LoginMurid',async (req, res)=>{

    const data = req.body.username;
    console.log(data);
   
    res.redirect('/Homepage-student');
});

app.get('/optlogin', async(req,res)=>
{
    res.render('optlogin');
});

app.get('/LoginPengajar', async(req,res)=>
{
    res.render('LoginPengajar');
});
app.post('/LoginPengajar',async (req, res)=>{

    const data = req.body.username;
    console.log(data);
   
    res.redirect('/Homepage-teacher');
});

app.get('/RegisterCourse', async(req,res)=>
{
    res.render('RegisterCourse');
});

app.get('/myCourse', async(req,res)=>
{
    res.render('myCourse');
});

app.get('/Homepage-teacher', async(req,res)=>
{
    res.render('Homepage-teacher');
});

app.use(express.static('public'));
  