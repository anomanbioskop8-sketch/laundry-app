// core/constants/order_strings.dart

class OrderStrings {
  OrderStrings._();

  // =========================
  // TITLE
  // =========================

  static const title = 'Order';

  // =========================
  // ACTION
  // =========================

  static const add = 'Tambah Order';
  static const edit = 'Edit Order';
  static const delete = 'Hapus Order';

  static const pay = 'Bayar Order';

  static const process = 'Proses Order';
  static const complete = 'Selesaikan Order';
  static const pickup = 'Ambil Order';
  static const cancel = 'Batalkan Order';

  // =========================
  // SUCCESS MESSAGE
  // =========================

  static const createSuccess = 'Order berhasil dibuat';

  static const saveSuccess = 'Order berhasil disimpan';

  static const deleteSuccess = 'Order berhasil dihapus';

  static const paySuccess = 'Pembayaran berhasil';

  static const updateStatusSuccess = 'Status order berhasil diperbarui';
  static const processSuccess = 'Order berhasil diproses';
  static const completeSuccess = 'Order berhasil diselesaikan';
  static const pickupSuccess = 'Order berhasil diambil';
  static const cancelSuccess = 'Order berhasil dibatalkan';

  // =========================
  // DIALOG
  // =========================

  static const confirmDelete = 'Yakin hapus order ini?';

  static const confirmPay = 'Yakin ingin menyelesaikan pembayaran order ini?';

  static const confirmProcess = 'Yakin ingin memproses order ini?';
  static const confirmComplete = 'Yakin ingin menyelesaikan order ini?';
  static const confirmPickup = 'Yakin order sudah diambil customer?';
  static const confirmCancel = 'Yakin ingin membatalkan order ini?';

  // =========================
  // EMPTY STATE
  // =========================

  static const empty = 'Belum ada order';

  // =========================
  // FIELD
  // =========================

  static const customer = 'Customer';

  static const items = 'Item Order';

  static const total = 'Total';

  static const paid = 'Bayar';

  static const change = 'Kembalian';

  static const status = 'Status';

  static const paymentStatus = 'Status Pembayaran';
  static const serviceType = 'Tipe Layanan';

  static const invoice = 'No. Invoice';

  // =========================
  // VALIDATION
  // =========================

  static const customerRequired = 'Customer wajib dipilih';

  static const itemsRequired = 'Minimal 1 item order';

  static const paidRequired = 'Nominal pembayaran wajib diisi';

  static const paidInvalid = 'Nominal pembayaran tidak valid';
}
