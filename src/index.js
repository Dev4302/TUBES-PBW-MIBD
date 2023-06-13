const mysql = require ('mysql');
const express = require('express');
const app = express();
const crypto = require('crypto');
const session = require('express-session');
const path = require('path');
const publicPath = path.resolve('public');
app.use(express.static(publicPath));



// app.use(express.static('public'));
// app.use(express.static('CSS'));
// app.use(express.static('Script'));
app.use(express.urlencoded({extended:true}));
app.use(
    session({
      secret: 'your-secret-key',
      resave: false,
      saveUninitialized: true
    })
  );

const authst = (req, res, next)=>
{
  if (req.session.username) {
    next();
  }
  else
  {
    res.redirect('/LoginMurid');
  }
}

const authtc = (req, res, next)=>
{
  if (req.session.username) {
    next();
  }
  else
  {
    res.redirect('/LoginPengajar');
  }
}

const conn = mysql.createConnection({
    user: 'root',
    password: '',
    database: 'tubeskursus',
    host: 'localhost'
});

const getUsers = () => {
    return new Promise((resolve, reject) => {
        conn.query('SELECT namasiswa, email FROM siswa', (err, result) => {
            if (err) {
                reject(err);
            } else {
                resolve(result);
            }
        });
    });
};

app.get('/tabel', async (req, res) => {
    try {
        const result = await getUsers();
        console.log(result);

        // Render the results in an HTML table
        const tableRows = result.map(row => `<tr><td>${row.namasiswa}</td><td>${row.email}</td></tr>`);
        const table = `<table>${tableRows.join('')}</table>`;

        res.send(table);
    } catch (err) {
        console.error(err);
        res.status(500).send('Error retrieving data from the database.');
    }
});

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

    const data = req.body;
    console.log(data.username);
    console.log(data.email);
    console.log(data.password);
    console.log(data.jenis);
    console.log(data.tarif);
   
    res.redirect('/jadwalPengajar');
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

  
app.get('/Homepage-student' , authst , async (req, res) => {
    try {
      const namasiswa = req.session.username; // Menggunakan req.session.username untuk mendapatkan username dari sesi
      console.log(namasiswa);
  
      res.render('Homepage-student', { namasiswa: namasiswa }); // Menggunakan namasiswa yang sudah didefinisikan
    } catch (err) {
      console.error(err);
      res.render('Homepage-student', { namasiswa: null });
    }
  });
  
  
  app.post('/Homepage-student', async (req, res) => {
    const username = req.body.username;
    req.session.username = username; // Menyimpan username ke dalam sesi
    console.log(username);
  
    try {
      const namasiswa = await getEmail(username);
      console.log("masuk sinii...")
      res.render('Homepage-student', { namasiswa });
    } catch (err) {
      console.error(err);
      res.render('Homepage-student', { namasiswa: null });
    }
  });

app.get('/daftarMurid', async(req,res)=>
{
    res.render('daftarMurid');
});
const createMurid = (namasiswa, email, asalsekolah, pass, idtingkat)=>{
    console.log(namasiswa);
    console.log(email);
    console.log(asalsekolah);
    console.log(pass);
    console.log(idtingkat);
    return new Promise((resolve, reject) => {
        const query = "INSERT INTO Siswa (namasiswa, email, asalsekolah, pass, idtingkat) VALUES (?, ?, ?, ?, ?)";
        conn.query(query, [namasiswa, email, asalsekolah, crypto.createHash('sha256').update(pass).digest('base64'), idtingkat], (err, result) => {
            if (err) {
                reject(err);
            } else {
                resolve(result);
            }
        });
    });
}
app.post('/daftarMurid',async (req, res)=>{
    const { username, email, password, jenis, sekolah } = req.body;

    try {

        await createMurid(username, email, sekolah, password, jenis);
        
        res.redirect('/optlogin');
    } catch (err) {
        console.error(err);
    }
});

app.get('/LoginMurid', async(req,res)=>
{
    res.render('LoginMurid');
});

 const cekUser = (username, hashed_pass)=>{
    return new Promise((resolve, reject) => {
        const selectQuery = "SELECT email, pass  FROM siswa WHERE email = ? AND pass = ?";
        conn.query(selectQuery, [username, hashed_pass], (err, results) => {
              console.log(username);
              console.log(hashed_pass);
              console.log(results);
              if (results.length > 0) {
                resolve(username);
              } else {
                console.log("error");
                reject(err);
                }
            });
    });
}

app.post('/LoginMurid', async (req, res) => {
  const username = req.body.email;
  const pass = req.body.password;
  console.log(username);
  console.log(pass);

  if (!username || !pass) {
    res.redirect('/Homepage-student');
    return;
  }

  const hashed_pass = crypto.createHash('sha256').update(pass).digest('base64');

  if (username && pass) {
    try {
      await cekUser(username, hashed_pass);

      req.session.username = username; // Menyimpan username ke dalam sesi
      console.log("input user:" + username);
      console.log("password : " + pass);
      res.redirect('/Homepage-student');
    } catch (err) {
      res.render('LoginMurid', { username: null, pass: null });
    }
  } else {
    res.render('LoginMurid', { username: null, pass: null });
  }
});




app.get('/optlogin', async(req,res)=>
{
    res.render('optlogin');
});

app.get('/LoginPengajar', async(req,res)=>
{
    res.render('LoginPengajar');
});
app.post('/LoginPengajar', async (req, res)=>{

    const data = req.body.username;
    console.log(data);
   
    res.redirect('/Homepage-teacher');
});

app.get('/RegisterCourse', authst, async(req,res)=>
{
    res.render('RegisterCourse');
});

app.get('/myCourse', authst, async(req,res)=>
{
    res.render('myCourse');
});

app.get('/Homepage-teacher',authtc, async(req,res)=> 
{
    res.render('Homepage-teacher');
});

app.get('/ReportStudent', authst, async(req, res)=>
{
  try {
    const namasiswa = req.session.username; // Menggunakan req.session.username untuk mendapatkan username dari sesi
    console.log(namasiswa);

    res.render('ReportStudent', { namasiswa: namasiswa }); // Menggunakan namasiswa yang sudah didefinisikan
  } catch (err) {
    console.error(err);
    res.render('ReportStudent', { namasiswa: null });
  }
});

app.post('/ReportStudent', async (req, res) => {
  const username = req.body.username;
  req.session.username = username; // Menyimpan username ke dalam sesi
  console.log(username);

  try {
    const namasiswa = await getEmail(username);
    console.log("masuk sinii...")
    res.render('ReportStudent', { namasiswa });
  } catch (err) {
    console.error(err);
    res.render('ReportStudent', { namasiswa: null });
  }
});

app.use(express.static('public'));
  