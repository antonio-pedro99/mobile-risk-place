import 'package:rpa/core/database_helper/database_helper.dart';
import 'package:rpa/core/storage_helper/storage_helper.dart';
import 'package:rpa/data/models/warns.model.dart';

abstract class IWarnService {
  Future<Warning> getWarn(String id);
  Future<List<Warning>> getWarnings();
  Future<String> createWarning(Warning warning);
  Future<Warning> updateWarning(Warning warning);
  Future<Warning> deleteWarn(String id);
}

class WarnService implements IWarnService {
  @override
  Future<String> createWarning(Warning warning) async {
    try {
      final db = DBHelper.instance;
      final storage = Storage.instance;
      String url = await storage.sendFile(file: warning.additionalData);
      warning.additionalData = url;
      await db.setData(
          collection: BDCollections.WARNINGS, value: warning.toJson());
      return 'Alerta Gerado com Sucesso';
    } on Exception catch (e) {
      return e.toString();
    }
  }

  @override
  Future<Warning> deleteWarn(String id) {
    // TODO: implement deleteWarn
    throw UnimplementedError();
  }

  @override
  Future<Warning> getWarn(String id) {
    // TODO: implement getWarn
    throw UnimplementedError();
  }

  @override
  Future<List<Warning>> getWarnings() {
    // TODO: implement getWarnings
    throw UnimplementedError();
  }

  @override
  Future<Warning> updateWarning(Warning warning) {
    // TODO: implement updateWarning
    throw UnimplementedError();
  }
}
