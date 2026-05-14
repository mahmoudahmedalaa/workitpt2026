abstract class IAppManager {
  Future<bool> isAppFirstTime();

  Future<void> saveBool({required String key, required bool value});

  bool getBool({required String key, bool defValue = false});

  Future<void> initiateDeviceIpAddress();

  Future<String?> getDeviceIpAddress();
}
