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
        "username": "mp1",
        "name": "Kayla Partee1",
        "email": "kayla_partee1@yahoo.com"
      },
      {
        "username": "mp2",
        "name": "Kayla Partee2",
        "email": "kayla_partee2@yahoo.com"
      }
    ]);
    print(await collection.find().toList());

    //update info
    //await collection.updateMany(where.eq("username", "mp"), modify.set("name", "Kyla P"));

    //print(await collection.find().toList());

    await collection.deleteOne({"username": "mp"});

    await collection.deleteMany({"username": "mp1"});
  }
}
