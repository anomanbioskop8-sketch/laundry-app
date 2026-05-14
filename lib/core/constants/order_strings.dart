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

  static const addGroup = 'Tambah Group Laundry';

  static const addItem = 'Tambah Item Laundry';

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

  static const emptyGroup = 'Belum ada group laundry';

  static const emptyItem = 'Belum ada item laundry';

  // =========================
  // FIELD
  // =========================

  static const customer = 'Customer';

  static const groups = 'Group Laundry';

  static const items = 'Item Laundry';

  static const laundryItem = 'Item Laundry';

  static const quantity = 'Jumlah';

  static const total = 'Total';

  static const subtotal = 'Subtotal';

  static const paid = 'Bayar';

  static const remaining = 'Sisa';

  static const change = 'Kembalian';

  static const status = 'Status';

  static const orderStatus = 'Status Order';

  static const paymentStatus = 'Status Pembayaran';

  static const serviceType = 'Jenis Layanan';

  static const speedType = 'Jenis Kecepatan';

  static const orderType = 'Jenis Order';

  static const weight = 'Berat (Kg)';

  static const price = 'Harga';

  static const invoice = 'No. Invoice';

  // =========================
  // VALIDATION
  // =========================

  static const customerRequired = 'Customer wajib dipilih';

  static const groupsRequired = 'Minimal 1 group laundry';

  static const itemsRequired = 'Minimal 1 item laundry';

  static const paidRequired = 'Nominal pembayaran wajib diisi';

  static const paidInvalid = 'Nominal pembayaran tidak valid';

  static const priceRequired = 'Harga wajib diisi';

  static const quantityRequired = 'Jumlah wajib diisi';

  static const weightRequired = 'Berat wajib diisi';
}
