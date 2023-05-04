import 'dart:developer';
import 'package:mongo_dart/mongo_dart.dart';
import 'const.dart';

class MongoDatabase {
  static connect() async {
    //connect to db
    var db = await Db.create(MONGO_URL);
    await db.open();
    inspect(db);
    var status = db.serverStatus();
    print(status);
    //open collection
    var collection = db.collection(COLLECTION_NAME);
    await collection.insertMany([
      {
        "category": "Heart",
        "affirmation": "432 Hz",
      },
      {
        "category": "Root",
        "affirmation": "174 Hz.",
      }
    ]);
    print(await collection.find().toList());

    //update info
    //await collection.updateMany(where.eq("username", "mp"), modify.set("name", "Kyla P"));

    //print(await collection.find().toList());


  }
}
