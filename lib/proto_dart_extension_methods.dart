import 'proto/addressbook.pb.dart';

extension PersonMethods on Person {

	
	String get greeting {
		return 'Hello $name';
	}

	set birthYear(int y) {
		name += ' $y';
	}

	int idPlusOne() {
		id += 1;
		return id;
	}

}


// extension NumberParsing on String {
//  int parseInt() {
//    return int.parse(this);
//  }
// }
