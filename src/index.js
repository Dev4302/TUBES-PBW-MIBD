const mysql = require ('mysql');
const express = require('express');
const app = express();

app.use(express.static('CSS'));
app.use(express.static('Script'));
app.use(express.urlencoded({extended:true}));

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


// const dbConnect = ()=>
// {
//     return new Promise((resolve,reject) =>
//     {
//         createPool.getConnection((err, conn)=>
//         {
//             if(err)
//             {
//                 reject(err);
//             }
//             else{
//                 resolve(conn);
//             }
//         })
//     })
// };

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

app.get('/Homepage-student', async(req,res)=>
{
    res.render('Homepage-student');
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
        conn.query(query, [namasiswa, email, asalsekolah, pass, idtingkat], (err, result) => {
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
app.post('/LoginMurid', async (req, res)=>{

    const data = req.body.username;
    const hashed_pass = crypto.createHash('sha256').update(password).digest('base64');
    const selectQuery = `SELECT * FROM siswa WHERE email = ? AND pass = ?`;

    if (username && password) {
        dbConnect()
          .then(conn => {
            conn.query(selectQuery, [username, hashed_pass], (err, results) => {
              if (err) {
                console.error(err);
                res.status(1000).send('Error');
              }
    
              if (results.length > 0) {
                req.session.username = results[0].name;
                res.redirect('/Homepage-student');
                
              } else {
                res.render('login', { username: null, password: null});
              }
            });
          })
      } else {
        res.render('login', { username: null, password: null});
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
  