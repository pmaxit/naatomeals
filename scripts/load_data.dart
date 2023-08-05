// load the data from json to firebase
import 'package:firedart/firedart.dart';

const apiKey = 'AIzaSyDLZ0idb8tcodqUx9TKV-mcF0TCPaDN9Fc';
const projectId = 'naatomeals';
const email = 'puneetgirdhar.in@gmail.com';
const password = "Passw@rd";

Future main() async {
  FirebaseAuth.initialize(apiKey, VolatileStore());
  Firestore.initialize(projectId);

  var auth = FirebaseAuth.instance;
  // Monitor sign-in state
  auth.signInState.listen((state) => print('Signed in: $state'));

  await auth.signIn(email, password);
  // get user object
  var user = await auth.getUser();
  print(user);

  // Instantiate a reference to a document - this happens offline
  var ref = Firestore.instance.collection('users').document('doc');
  // Subscribe to changes to that document
  final subscription =
      ref.stream.listen((document) => print('updated: $document'));

  // Update the document
  await ref.update({'value': 'test'});

  // Get a snapshot of the document
  var document = await ref.get();
  print('snapshot: ${document['value']}');

  auth.signOut();
  auth.close();

  await Future.delayed(Duration(milliseconds: 100));

  Firestore.instance.close();
}
