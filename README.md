# Telco Customer Churn Prediction using Naive Bayes

## Overview

Project ini bertujuan untuk memprediksi apakah seorang pelanggan berpotensi churn (berhenti berlangganan) atau tidak menggunakan algoritma Naive Bayes Bernoulli. Variabel X dan y yang digunakan adalah biner, yang mana 1 menyatakan "Ya" dan 0 menyatakan "Tidak".

Dataset disimpan di PostgreSQL (localhost) dan diekstrak menggunakan SQL query yang dipanggil menggunakan SQLAlchemy sebelum dimodelkan di Python menggunakan scikit-learn.

## Informasi fitur

### Variabel X
senior_citizen = Apakah pelanggan tersebut warga lanjut usia atau bukan? (1: Ya, 0: Tidak)


partner = Apakah pelanggan memiliki pasangan atau tidak? (1= Ya, 0 = Tidak)


dependents = Apakah pelanggan memiliki tanggungan atau tidak? (1 = Ya, 0 = Tidak)
phone_service = Apakah pelanggan memiliki layanan telepon atau tidak? (1 = Ya, 0 = Tidak)
multiple_lines = Apakah pelanggan memiliki beberapa saluran telepon atau tidak (1 = Ya, 0 = Tidak)
internet_service = Apakah pelanggan memiliki layanan internet? (1 = Ya, 0 = Tidak)
online_security = Apakah pelanggan memiliki keamanan online atau tidak? (1 = Ya, 0 = Tidak)
tech_support = Apakah pelanggan memiliki dukungan teknis atau tidak? (1 = Ya, 0 = Tidak)
streaming_tv = Apakah pelanggan memiliki TV streaming atau tidak? (1 = Ya, 0 = Tidak)
paperless_billing = Apakah pelanggan memiliki sistem penagihan tanpa kertas atau tidak? (1 = Ya, 0 = Tidak)

### Variabel y
churn_label = Apakah customer churn atau tidak? (1 = churn, 0 = tidak churn)

data ini berjumlah 3.700 baris, dan semuanya bernilai 1 (Ya) atau 0 (Tidak)

data_source: https://www.kaggle.com/datasets/rashadrmammadov/customer-churn-dataset

## Project Structure

query_repo2.sql
naive_bayes.ipynb
presentation.pptx
.env.example
.gitignore
README.md

## Technologies

Python: Pandas, Psycopg2, SQLAlchemy, Scikit-Learn
Database: PostgreSQL

## Workflow

1. Seleksi tabel dengan query mengikuti kebutuhan analisis di PostgreSQL
2. Tarik dataset dari PostgreSQL
3. Mengubah hasil query menjadi Pandas DataFrame.
4. Pemeriksaan ulang kembali.
5. Melakukan feature engineering.
6. Melatih model Naive Bayes.
7. Mengevaluasi performa model.
8. Melakukan uji coba dengan data baru sebagai demonstrasi.
9. Menampilkan keputusan dengan data baru.

## Ringkasan Hasil

Berdasarkan pengujian menggunakan data uji yang seimbang (balanced dataset dengan total 740 sampel untuk setiap kelas), model Bernouulli Naive Bayes (BNB) yang berhasil mencapai tingkat akurasi keseluruhan sebesar 72%. Performa model menunjukkan stabilitas yang tinggi di kedua kelas target, di mana nilai macro average dan weighted average untuk F1-score konsisten berada di angka 72%.

Dari sudut pandang strategi bisnis, model ini memberikan nilai defensif yang kuat melalui nilai Recall sebesar 73% pada kelas Churn (Class 1). Metrik ini membuktikan bahwa jaring prediksi model sangat sensitif dan mampu mendeteksi secara dini 73% dari total seluruh pelanggan yang memiliki risiko nyata untuk berhenti berlangganan. Sensitivitas Recall yang tinggi ini jauh lebih krusial bagi perusahaan untuk meminimalkan risiko lolosnya pelanggan potensial yang membutuhkan intervensi retensi segera.

## Database Configuration

Buat file `.env` berdasarkan `.env.example` dan sesuaikan dengan konfigurasi PostgreSQL anda.

## Author

Mohammad Ichsan M. (2026)
