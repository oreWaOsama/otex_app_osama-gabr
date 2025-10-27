import 'package:otex_app_test/core/helper/app_image_assets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqlDb {
  static Database? _db;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await intialDb();
      return _db;
    } else {
      return _db;
    }
  }

  intialDb() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'otex.db');
    Database myDb = await openDatabase(path, onCreate: _createDB, version: 1);
    return myDb;
  }

  _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE "categories" (
        "id" INTEGER AUTOINCREMENT NOT NULL PRIMARY KEY,
        "name" TEXT NOT NULL
      )
    ''');
    await db.execute('''
      CREATE TABLE products (
        "id" INTEGER PRIMARY KEY AUTOINCREMENT,
        "title" TEXT NOT NULL,
        "description" TEXT,
        "image_path" TEXT,
        "original_price" REAL NOT NULL,
        "current_price" REAL NOT NULL,
        "sold_quantity" INTEGER NOT NULL DEFAULT 0,
        "category_id" INTEGER,
        FOREIGN KEY (category_id) REFERENCES categories (id)
      )
    ''');
    await db.execute('''
      CREATE TABLE "packages" (
      "id" INTEGER AUTOINCREMENT NOT NULL PRIMARY KEY,
      "title" TEXT NOT NULL,
      "price" TEXT NOT NULL DEFAULT 0,
      "view_boost" INTEGER NOT NULL DEFAULT 1,
      "features" TEXT NOT NULL,
      "type" TEXT,
      "is_best_value" INTEGER NOT NULL DEFAULT 0,
      "is_highest_views" INTEGER NOT NULL DEFAULT 0
      ) ''');
    await _insertDummyData(db);
  }

  Future<void> _insertDummyData(Database db) async {
    // Categories
    final categories = [
      {'name': 'ملابس'},
      {'name': 'اكسسوارات'},
      {'name': 'الكترونيات'},
      {'name': 'عقارات'},
    ];
    for (var c in categories) {
      await db.insert('categories', c);
    }

    // Products
    final products = [
      {
        'title': 'قميص قطن',
        'description': 'قميص خفيف ومريح',
        'image_path': Assets.shirt,
        'original_price': 79.99,
        'current_price': 59.99,
        'sold_quantity': 25,
        'category_id': 1, // ملابس
      },
      {
        'title': 'هودي قطن',
        'description': 'مناسب للاجواء الباردة',
        'image_path': Assets.hodee,
        'original_price': 120.00,
        'current_price': 89.00,
        'sold_quantity': 12,
        'category_id': 1, // ملابس
      },
      {
        'title': 'قلادة مجوهرات',
        'description': 'قلادة أنيقة من الذهب و المجوهرات',
        'image_path': Assets.necklace,
        'original_price': 299.99,
        'current_price': 249.99,
        'sold_quantity': 5,
        'category_id': 2, // اكسسوارات
      },
      {
        'title': 'حقيبة يد نسائية',
        'description': 'حقيبة يد أنيقة من الجلد الطبيعي',
        'image_path': Assets.bag,
        'original_price': 199.99,
        'current_price': 159.99,
        'sold_quantity': 8,
        'category_id': 2, // اكسسوارات
      },
      {
        'title': 'كاميرا',
        'description': 'كاميرا تصوير احترافي',
        'image_path': Assets.camera,
        'original_price': 249.99,
        'current_price': 199.99,
        'sold_quantity': 15,
        'category_id': 3, // الكترونيات
      },
      {
        'title': 'طابعة',
        'description': 'طابعة الوان',
        'image_path': Assets.printer,
        'original_price': 199.99,
        'current_price': 149.49,
        'sold_quantity': 8,
        'category_id': 3, // الكترونيات
      },
      {
        'title': 'فيلا 6 غرف',
        'description': 'فيلا مفروشة في منطقة راقية',
        'image_path': Assets.villa1,
        'original_price': 500000.00,
        'current_price': 450000.00,
        'sold_quantity': 1,
        'category_id': 4, // عقارات
      },
      {
        'title': 'فيلا 5 غرف',
        'description': 'فيلا مع حديقة وحمام سباحة',
        'image_path': Assets.villa2,
        'original_price': 1200000.00,
        'current_price': 1000000.00,
        'sold_quantity': 1,
        'category_id': 4, // عقارات
      },
    ];
    for (var p in products) {
      await db.insert('products', p);
    }

    // Packages
    final packages = [
      {
        'title': 'أساسية',
        'price': 3000,
        'view_boost': 0,
        'features':
            '{"icon": "assets/icons/acute.svg", "title": "صلاحية الأعلان 30 يوم", "subtitle": null}',
        'type': null,
        'is_best_value': 0,
        'is_highest_views': 0,
      },
      {
        'title': 'أكسترا',
        'price': 4000,
        'view_boost': 7,
        'features':
            '{"icon": "assets/icons/acute.svg", "title": "صلاحية الأعلان 30 يوم", "subtitle": null}|{"icon": "assets/icons/rocket.svg", "title": "رفع لأعلى القائمة كل 3 أيام", "subtitle": null}|{"icon": "assets/icons/keep.svg", "title": "تثبيت في مقاول صحي", "subtitle": "( خلال ال48 ساعة القادمة )"}',
        'type': null,
        'is_best_value': 0,
        'is_highest_views': 0,
      },
      {
        'title': 'بلس',
        'details':
            'صلاحية الأعلان 30 يوم + رفع لأعلى القائمة كل 2 يوم + تثبيت في مقاول صحي + ظهور في كل محافظات مصر + أعلان مميز',
        'price': 5000,
        'view_boost': 18,
        'features':
            '{"icon": "assets/icons/acute.svg", "title": "صلاحية الأعلان 30 يوم", "subtitle": null}|{"icon": "assets/icons/rocket.svg", "title": "رفع لأعلى القائمة كل 2 يوم", "subtitle": null}|{"icon": "assets/icons/keep.svg", "title": "تثبيت في مقاول صحي", "subtitle": "( خلال ال48 ساعة القادمة )"}|{"icon": "assets/icons/globe.svg", "title": "ظهور في كل محافظات مصر", "subtitle": null}|{"icon": "assets/icons/workspace_premium.svg", "title": "أعلان مميز", "subtitle": null}|{"icon": "assets/icons/keep.svg", "title": "تثبيت في مقاول صحي في الجهراء", "subtitle": "( خلال ال48 ساعة القادمة )"}',
        'type': 'أفضل قيمة مقابل سعر',
        'is_best_value': 1,
        'is_highest_views': 0,
      },
      {
        'title': 'سوبر',
        'details':
            'صلاحية الأعلان 30 يوم + رفع لأعلى القائمة كل 2 يوم + تثبيت في مقاول صحي + ظهور في كل محافظات مصر + أعلان مميز',
        'price': 6000,
        'view_boost': 24,
        'features':
            '{"icon": "assets/icons/acute.svg", "title": "صلاحية الأعلان 30 يوم", "subtitle": null}|{"icon": "assets/icons/rocket.svg", "title": "رفع لأعلى القائمة كل 2 يوم", "subtitle": null}|{"icon": "assets/icons/keep.svg", "title": "تثبيت في مقاول صحي", "subtitle": "( خلال ال48 ساعة القادمة )"}|{"icon": "assets/icons/globe.svg", "title": "ظهور في كل محافظات مصر", "subtitle": null}|{"icon": "assets/icons/workspace_premium.svg", "title": "أعلان مميز", "subtitle": null}|{"icon": "assets/icons/keep.svg", "title": "تثبيت في مقاول صحي في الجهراء", "subtitle": "( خلال ال48 ساعة القادمة )"}',
        'type': 'أعلى مشاهدات',
        'is_best_value': 0,
        'is_highest_views': 1,
      },
    ];
    for (var b in packages) {
      await db.insert('packages', b);
    }
  }

  Future<List<Map<String, dynamic>>> getProducts() async {
    final database = await db;
    return await database!.query('products');
  }

  Future<List<Map<String, dynamic>>> getCategories() async {
    final database = await db;
    return await database!.query('categories');
  }

  Future<List<Map<String, dynamic>>> getPackages() async {
    final database = await db;
    return await database!.query('packages');
  }

  Future<List<Map<String, dynamic>>> getProductsByCategory(
    int categoryId,
  ) async {
    final database = await db;
    return await database!.query(
      'products',
      where: 'category_id = ?',
      whereArgs: [categoryId],
    );
  }
}
