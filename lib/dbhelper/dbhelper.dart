import 'package:assign_8/models/product.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static const dbName = 'productManagement.db';
  static const dbVersion = 2;

  static const tbName = 'products';
  static const colSku = 'sku';
  static const colName = 'name';
  static const colDescription = 'description';
  static const colPrice = 'price';
  static const colDiscountedPrice = 'dPrice';
  static const colQuantity = 'quantity';
  static const colManufacturer = 'manufacturer';

  static Future<Database> openDB() async {
    var path = join(await getDatabasesPath(), dbName);
    var sql =
        "CREATE TABLE IF NOT EXISTS $tbName ($colSku TEXT PRIMARY KEY, $colName TEXT, $colDescription TEXT, $colPrice DECIMAL(10, 2), $colDiscountedPrice DECIMAL(10, 2), $colQuantity INT, $colManufacturer TEXT)";
    var db = await openDatabase(
      path,
      version: dbVersion,
      onCreate: (db, version) {
        db.execute(sql);
        print("Database Created");
      },
      onUpgrade: (db, oldVersion, newVersion) {
        if (newVersion <= oldVersion) return;
        db.execute("DROP TABLE IF EXISTS $tbName");
        db.execute(sql);
      },
    );
    return db;
  }

  static void insertProduct(Product p) async {
    final db = await DbHelper.openDB();
    await db.insert(tbName, p.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static void deleteProduct(Product p) async {
    final db = await DbHelper.openDB();
    await db.delete(tbName, where: "$colSku = '${p.sku}'");
  }

  static Future<List<Map<String, dynamic>>> fetch() async {
    final db = await DbHelper.openDB();
    var result = await db.rawQuery("SELECT * FROM $tbName");
    return result;
  }
}
