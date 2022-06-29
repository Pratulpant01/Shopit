import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shopit/resources/firestore_methods.dart';

part 'firestore_event.dart';
part 'firestore_state.dart';

class FirestoreBloc extends Bloc<FirestoreEvent, FirestoreState> {
  FirestoreMethods firestoreMethods;
  FirestoreBloc(this.firestoreMethods) : super(FirestoreLoading(userData: {})) {
    on<getUserEvent>((event, emit) async {
      emit(FirestoreLoading(userData: {}));
      final userData = await firestoreMethods.getUserDetails();
      emit(FirestoreLoaded(userData: userData));
    });
  }
}
