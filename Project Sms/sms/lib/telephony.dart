import 'package:telephony/telephony.dart';

class SmsService {
  final Telephony _telephony = Telephony.instance;

  // Meminta izin SMS
  Future<bool> requestPermissions() async {
    return await _telephony.requestPhoneAndSmsPermissions ?? false;
  }

  // Mendengarkan SMS masuk di foreground
  void listenToSms({
    required Function(SmsMessage) onMessage,
    Function(SmsMessage)? onBackgroundMessage,
  }) {
    _telephony.listenIncomingSms(
      onNewMessage: onMessage,
      onBackgroundMessage: onBackgroundMessage ?? _defaultBackgroundHandler,
    );
  }

  // Fungsi kirim SMS
  Future<void> sendSms({
    required String to,
    required String message,
  }) async {
    await _telephony.sendSms(to: to, message: message);
  }

  // Handler default jika tidak ada yang ditentukan
  static void _defaultBackgroundHandler(SmsMessage message) {
    print("Pesan diterima di background: ${message.body}");
  }
}
