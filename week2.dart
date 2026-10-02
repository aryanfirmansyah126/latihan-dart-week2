// fungsi buat nyari dapet diskon brp persen
double hitungPersenDiskon(double totalBelanja, bool membership) {
  if (totalBelanja >= 100000 && membership == true) {
    return 0.15; // dapet diskon 10% + 5% bonus member
  }
  if (totalBelanja >= 100000 && membership == false) {
    return 0.10; // dapet diskon 10% aja
  }
  return 0; // belanja di bawah 100rb gak dapet diskon
}

// fungsi buat ngitung potongan uang rupiahnya
double hitungPotongan(double pot_diskon, double totalBelanja) {
  double potongan = pot_diskon * totalBelanja;
  
  // kalo hasil potongannya lebih dari 25rb, dipentokin di 25rb
  if (potongan >= 25000) {
    return 25000;
  }
  return potongan;
}

// fungsi utama buat ngitung total bayar setelah dipotong diskon
double hitungTotalBayar(double totalBelanja, bool membership) {
  double persen = hitungPersenDiskon(totalBelanja, membership);
  double potongan = hitungPotongan(persen, totalBelanja);

  double totalBayar = totalBelanja - potongan;
  return totalBayar;
}

void main() {
  // tes 4 skenario sesuai tabel tugas
  print("Skenario 1: Rp ${hitungTotalBayar(80000, false).toInt()}");
  print("Skenario 2: Rp ${hitungTotalBayar(150000, false).toInt()}");
  print("Skenario 3: Rp ${hitungTotalBayar(150000, true).toInt()}");
  print("Skenario 4: Rp ${hitungTotalBayar(300000, true).toInt()}");
}