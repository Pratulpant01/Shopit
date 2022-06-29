// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'firestore_bloc.dart';

@immutable
abstract class FirestoreState {
  var userData;
  FirestoreState({
    required this.userData,
  });
}

class FirestoreLoading extends FirestoreState {
  FirestoreLoading({required super.userData});
}

class FirestoreLoaded extends FirestoreState {
  FirestoreLoaded({required super.userData});
}
