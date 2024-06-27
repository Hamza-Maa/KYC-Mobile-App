import 'package:kyc_mobile_app/app/models/user_model.dart';
import 'package:mongo_dart/mongo_dart.dart';

class SignUpService {
  late final Db _db;

  SignUpService() {
    _db = Db('mongodb://192.168.1.13:27017/Mobile_App');
  }
  Future   signUp(SignUpData signUpData) async {
    await _db.open();
    final usersCollection = _db.collection('users');

    Map<String, dynamic> user = {
      'email': signUpData.email,
      'firstName': signUpData.firstName,
      'lastName': signUpData.lastName,
      'password':signUpData.password,
      'birthDate': signUpData.birthDate.toIso8601String(),
      'country': signUpData.country,
    };

    user['_id'] = ObjectId();
    await usersCollection.insertOne(user);

    await _db.close();

    return user['_id'];
  }
  //login service here
  Future<SignUpData?> login(String email, String password) async {
    await _db.open();
    final usersCollection = _db.collection('users');

    final user = await usersCollection.findOne({
      'email': email,
      'password': password,
    });

    await _db.close();
    if (user != null && user['falsified'] == false) {
      return SignUpData(
        email: user['email'],
        firstName: user['firstName'],
        lastName: user['lastName'],
        password: user['password'],
        birthDate: DateTime.parse(user['birthDate']),
        country: user['country'],
        falsified: user['falsified'],
      );
    } else {
      return null;
    }
  }

  Future<bool> doesEmailExist(String email) async {
    await _db.open();
    final usersCollection = _db.collection('users');

    final user = await usersCollection.findOne({'email': email});

    await _db.close();

    return user != null;
  }

  Future<void> updatePassword(String email, String newPassword) async {
    await _db.open();
    final usersCollection = _db.collection('users');

    await usersCollection.update(
      where.eq('email', email),
      modify.set('password', newPassword),
    );

    await _db.close();
  }

  Future<void> updateFalsified(ObjectId id, bool falsified) async {
    await _db.open();
    final usersCollection = _db.collection('users');

    await usersCollection.updateOne(
      where.id(id),
      modify.set('falsified', falsified),
    );

    await _db.close();
  }


}
