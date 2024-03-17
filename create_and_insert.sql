-- Membuat Sebuah Tipe Data
create type jk as enum ('L', 'P');
-- Membuat Table Nasabah
create table nasabah (
    id_nasabah bigserial primary key,
    nama_depan varchar(255) not null,
    nama_belakang varchar(255) not null,
    nama_ibu_kandung varchar(255) not null,
    jenis_kelamin jk not null,
    no_ktp varchar(16) not null,
    alamat varchar(255) not null,
    no_telepon varchar(12) not null
);
-- Memasukkan Data di Table Nasabah
insert into nasabah (
        nama_depan,
        nama_belakang,
        nama_ibu_kandung,
        jenis_kelamin,
        no_ktp,
        alamat,
        no_telepon
    )
values (
        'Bagus',
        'Putra',
        'Suyono',
        'L',
        '1110000000000001',
        'Krian Sidoarjo',
        '081212345678'
    ),
    (
        'Faiq',
        'Abiyyi',
        'Evi',
        'L',
        '1110000000000002',
        'Wonoayu Sidoarjo',
        '081212345678'
    ),
    (
        'Bima',
        'Mukti',
        'Wibowo',
        'L',
        '1110000000000003',
        'Demak Surabaya',
        '081212345678'
    );
-- Membuat Table Akun
create table akun (
    id_akun bigserial primary key,
    username varchar(25) not null,
    password varchar(25) not null,
    email varchar(25) not null,
    no_rekening varchar(10) not null,
    nasabah_id int not null
);
-- Memasukkan Data di Table Akun
insert into akun (
        username,
        password,
        email,
        no_rekening,
        nasabah_id
    )
values (
        'bagusaja',
        'bagus123',
        'bagus@gmail.com',
        '1112223330',
        1
    ),
    (
        'faiqaja',
        'faiq123',
        'faiq@gmail.com',
        '3332221110',
        2
    ),
    (
        'bimaaja',
        'bima123',
        'bima@gmail.com',
        '2221113330',
        3
    );
-- Membuat Table Transaksi
create table transaksi (
    id_transaksi bigserial primary key,
    tgl_transaksi varchar(25) not null,
    rekening_tujuan varchar(15) not null,
    keterangan varchar(255) not null,
    nominal_transaksi int not null,
    akun_id int not null
);
-- Operasi CRUD 
-- Menampilkan semua data dari tabel akun, nasabah, dan transaksi
SELECT *
FROM akun;
SELECT *
FROM nasabah;
SELECT *
FROM transaksi;
select *
from nasabah
    inner join akun on nasabah.id_nasabah = akun.nasabah_id;
-- Memperbarui data dari tabel
UPDATE nasabah
SET no_telepon = '081259702559'
WHERE id_nasabah = 2;
-- Menghapus data dari tabel
delete from nasabah
where id_nasabah = 1;
-- Menghapus tabel dari database
drop table nasabah;