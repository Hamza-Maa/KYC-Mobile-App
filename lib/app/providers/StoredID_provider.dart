import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bson/bson.dart';

// Define a StateProvider for storing the ObjectId
final idProvider = StateProvider<ObjectId?>((ref) => ObjectId());

/*
//here is how can you call it :
//In this code, ref.watch(idProvider).state is used to access the stored ID
//this the correct one :
ObjectId? id = ref.watch(idProvider.notifier).state;
*/
