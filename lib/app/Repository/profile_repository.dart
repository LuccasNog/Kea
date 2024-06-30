//Vamos usar essa classe como provider também para notificar alterações

import 'package:decor/app/Database/db.dart';
import 'package:flutter/foundation.dart';

class ProfileRepository extends ChangeNotifier {
  final BancodDados _bancodDados = BancodDados.instance;

  Future<int> insertProfile(Map<String, dynamic> profile) async {
    return await _bancodDados.insertProfile(profile);
  }
}
