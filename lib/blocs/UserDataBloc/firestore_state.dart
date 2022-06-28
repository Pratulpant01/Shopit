// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'firestore_bloc.dart';

@immutable
abstract class FirestoreState {}

class FirestoreInitial extends FirestoreState {}

class FirestoreLoading extends FirestoreState {}

class FirestoreLoaded extends FirestoreState {
  var userData;
  FirestoreLoaded({
    required this.userData,
  });
}
