const mysql = require('mysql');
const express = require('express');
const app = express();
const crypto = require('crypto');
const session = require('express-session');
const path = require('path');
const publicPath = path.resolve('public');
const multer = require('multer');
const upload = multer();
app.use(express.static(publicPath));



// app.use(express.static('public'));
// app.use(express.static('CSS'));
// app.use(express.static('Script'));
app.use(express.urlencoded({ extended: true }));
app.use(
  session({
    secret: 'your-secret-key',
    resave: false,
    saveUninitialized: true
  })
);

const authst = (req, res, next) => {
  if (req.session.username) {
    next();
  }
  else {
    res.redirect('/LoginMurid');
  }
}

const authtc = (req, res, next) => {
  if (req.session.username) {
    next();
  }
  else {
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
app.get('/', async (req, res) => {
  res.render('Face1');
});


app.get('/aboutus', async (req, res) => {
  res.render('AboutUs!');
});


const createGuru = (nama, email, password, tarif) => {
  return new Promise((resolve, reject) => {
    const query = "INSERT INTO Guru (nama, email, password, tarif) VALUES (?, ?, ?, ?)";
    conn.query(query, [nama, email, password, tarif], (err, result) => {
      if (err) {
        reject(err);
      } else {
        resolve(result);
      }
    });
  });
};

// Menangani rute GET untuk halaman pendaftaran pengajar
app.get('/daftarPengajar', async (req, res) => {
  res.render('daftarPengajar');
});

// Menangani rute POST untuk menyimpan data pengajar ke database
app.post('/daftarPengajar', async (req, res) => {
  const { nama, email, password, tarif } = req.body;

  try {
    await createGuru(nama, email, password, tarif); // Memanggil fungsi createGuru untuk menyimpan data pengajar ke database

    res.redirect('/jadwalPengajar'); // Mengalihkan pengguna ke halaman jadwal pengajar setelah pendaftaran berhasil
  } catch (err) {
    console.error(err);
  }
});


app.get('/jadwalPengajar', async (req, res) => {
  res.render('jadwalPengajar');
});
app.post('/jadwalPengajar', async (req, res) => {

  const data = req.body.username;
  console.log(data);

  res.redirect('/optlogin');
});


app.get('/Homepage-student', authst, async (req, res) => {
  try {
    const namasiswa = req.session.username;
    console.log(namasiswa);
    const pathfoto = "img/defaultprofile.jpg";
    const foto = "SELECT foto FROM siswa WHERE email = ?";
    conn.query(foto, [namasiswa], (err, results) => {
      if (results === null || results.length === 0) {
        res.render('Homepage-student', { namasiswa: namasiswa, pathfoto });
      } else {
        const imageBlob = results[0].foto;
        if (imageBlob !== null) {
          res.render('Homepage-student', { namasiswa: namasiswa, pathfoto: imageBlob });
        } else {
          res.render('Homepage-student', { namasiswa: namasiswa, pathfoto });
        }
      }
    });
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

app.get('/daftarMurid', async (req, res) => {
  res.render('daftarMurid');
});
const createMurid = (namasiswa, email, asalsekolah, pass, idtingkat) => {
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
app.post('/daftarMurid', async (req, res) => {
  const { username, email, password, jenis, sekolah } = req.body;

  try {

    await createMurid(username, email, sekolah, password, jenis);

    res.redirect('/optlogin');
  } catch (err) {
    console.error(err);
  }
});

app.get('/LoginMurid', async (req, res) => {
  res.render('LoginMurid');
});

const cekUser = (username, hashed_pass) => {
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

      req.session.username = username;
      res.redirect('/Homepage-student');
    } catch (err) {
      res.render('LoginMurid', { username: null, pass: null });
    }
  } else {
    res.render('LoginMurid', { username: null, pass: null });
  }
});




app.get('/optlogin', async (req, res) => {
  res.render('optlogin');
});

app.get('/LoginPengajar', async (req, res) => {
  res.render('LoginPengajar');
});
app.post('/LoginPengajar', async (req, res) => {

  const data = req.body.username;
  console.log(data);

  res.redirect('/Homepage-teacher');
});

const createKursus = (idkursus, tanggalPertemuan, idsiswa) => {
  console.log(idkursus);
  console.log(tanggalPertemuan);
  console.log(idsiswa);

  return new Promise((resolve, reject) => {
    const query = "INSERT INTO kursus (idkursus, tanggalPertemuan, idsiswa) VALUES (?, ?, ?)";
    conn.query(query, [idkursus, tanggalPertemuan, idsiswa], (err, result) => {
      if (err) {
        reject(err);
      } else {
        resolve("masuk kesini : " + result);
      }
    });
  });
}

async function cariidsiswa(email) {
  try {
    const q_idsiswa = "SELECT idsiswa FROM siswa WHERE email = ?";
    const results = await conn.query(q_idsiswa, [email]);

    if (results.length > 0) {
      return results[0].idsiswa;
    } else {
      return null;
    }
  } catch (error) {
    console.error(error);
    return null;
  }
}


app.get('/RegisterCourse', authst, async (req, res) => {
  const namasiswa = req.session.username;
  const idsiswa = "SELECT idsiswa FROM siswa WHERE email = ?";
  conn.query(idsiswa, [namasiswa], (err, results) => {
    const idsiswaValue = results[0].idsiswa;
    console.log(idsiswaValue);
  });
  res.render('RegisterCourse');
});

app.post('/registermp', authst, async (req, res) => {
  const data = req.body;
  const namasiswa = req.session.username;
  const idsiswa = "SELECT idsiswa FROM siswa WHERE email = ?";

  conn.query(idsiswa, [namasiswa], (err, results) => {
    if (err) {
      console.error(err);
      res.status(500).json({ error: 'Internal Server Error' });
      return;
    }

    const idsiswaValue = results[0].idsiswa;

    const qfisika = "INSERT INTO kursus (tanggalpertemuan, idsiswa, namakursus) VALUES (null, ?, 'fisika')";
    const qkimia = "INSERT INTO kursus (tanggalpertemuan, idsiswa, namakursus) VALUES (null, ?, 'kimia')";
    const qmatematika = "INSERT INTO kursus (tanggalpertemuan, idsiswa, namakursus) VALUES (null, ?, 'matematika')";

    console.log(data.course);

    if (data.course.includes('fisika')) {
      conn.query(qfisika, [idsiswaValue], (err, result) => {
        if (err) {
          console.error(err);
          res.status(500).json({ error: 'Internal Server Error' });
        } else {
          console.log("Kursus fisika berhasil ditambahkan");
        }
      });
    }

    if (data.course.includes('kimia')) {
      conn.query(qkimia, [idsiswaValue], (err, result) => {
        if (err) {
          console.error(err);
          res.status(500).json({ error: 'Internal Server Error' });
        } else {
          console.log("Kursus kimia berhasil ditambahkan");
        }
      });
    }

    if (data.course.includes('matematika')) {
      conn.query(qmatematika, [idsiswaValue], (err, result) => {
        if (err) {
          console.error(err);
          res.status(500).json({ error: 'Internal Server Error' });
        } else {
          console.log("Kursus matematika berhasil ditambahkan");
        }
      });
    }

    res.redirect("/myCourse");
  });
});



app.get('/myCourse', authst, async (req, res) => {
  try {
    const namasiswa = req.session.username;
    const qUserId = "SELECT idsiswa FROM siswa WHERE email = ?";

    conn.query(qUserId, [namasiswa], (err, results) => {
      if (err) {
        console.error(err);
        res.status(500).json({ error: 'Internal Server Error' });
        return;
      }

      const idsiswaValue = results[0].idsiswa;
      console.log(idsiswaValue);

      const qkursus = "SELECT idkursus, tanggalpertemuan, namakursus FROM kursus WHERE idsiswa = ?";

      conn.query(qkursus, [idsiswaValue], (err, results) => {
        if (err) {
          console.error(err);
          res.status(500).json({ error: 'Internal Server Error' });
          return;
        }

        const namakursus = results.map((row) => row.namakursus);
        let disfisika = "none";
        let diskimia = "none";
        let dismat = "none";
        let nocoursefound = "none";

        if (namakursus.includes("fisika")) {
          disfisika = "block";
        }
        if (namakursus.includes("kimia")) {
          diskimia = "block";
        }
        if (namakursus.includes("matematika")) {
          dismat = "block";
        }
        if (disfisika && diskimia && dismat === "none") {
          nocoursefound = "block";
        }


        console.log(namakursus);

        res.render('myCourse', { namasiswa: namasiswa, namakursus: namakursus, disfisika, diskimia, dismat, nocoursefound });
      });
    });
  } catch (err) {
    console.error(err);
    res.render('myCourse', { namasiswa: null });
  }

});



app.get('/Homepage-teacher', async (req, res) => {
  res.render('Homepage-teacher');
});

app.get('/ReportStudent', authst, async (req, res) => {
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
    res.render('ReportStudent', { namasiswa });
  } catch (err) {
    console.error(err);
    res.render('ReportStudent', { namasiswa: null });
  }
});

app.get('/Profile', authst, async (req, res) => {
  try {
    const namasiswa = req.session.username;
    console.log(namasiswa);
    const pathfoto = "img/defaultprofile.jpg";
    const foto = "SELECT foto FROM siswa WHERE email = ?";
    conn.query(foto, [namasiswa], (err, results) => {
      if (results === null || results.length === 0) {
        res.render('Profile', { namasiswa: namasiswa, pathfoto });
      } else {
        const imageBlob = results[0].foto;
        if (imageBlob !== null) {
          res.render('Profile', { namasiswa: namasiswa, pathfoto: imageBlob });
        } else {
          res.render('Profile', { namasiswa: namasiswa, pathfoto });
        }
      }
    });
  } catch (err) {
    console.error(err);
    res.render('Profile', { namasiswa: null });
  }
});
app.post('/uploadProfilePic', authst, upload.single('profilePic'), (req, res) => {
  const namasiswa = req.session.username;
  const profilePicBlob = req.file.buffer;

  const sql = "UPDATE siswa SET foto = ? WHERE email = ?";
  conn.query(sql, [profilePicBlob, namasiswa], (error, results) => {
    if (error) {
      // Handle error
      console.error(error);
    } else {
      // Berhasil melakukan update
      res.redirect("/Homepage-student");
    }
   
  })
});

app.get('/MateriTeacher', (req,res)=>{
  res.render('MateriTeacher');
})


  app.use(express.static('public'));
