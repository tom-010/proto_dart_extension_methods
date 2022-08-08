import 'proto/addressbook.pb.dart';
import 'package:protobuf/protobuf.dart';

class Model<T extends GeneratedMessage> {
	Future<void> Function() save;
	List<String> Function() validate;
	Future<void> Function() delete;
	Model({
		required this.save,
		required this.validate,
		required this.delete
	});
}



// ModelRegistry converts a protobuf message T to a Model<T>
// The user has to register it first in main.
class ModelRegistry {

	final Map<Type, dynamic> _entries = {};
	
	register<T extends GeneratedMessage>(Model<T> Function(T) toModel) {
		print(T);
		_entries[T] = toModel;
	}

	Model<T> toModel<T extends GeneratedMessage>(T instance) {
		final fn = _entries[instance.runtimeType];
		assert(fn != null, 'there was no model builder registered for ${instance.runtimeType}');
		return fn(instance) as Model<T>;
	}
}


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
	
	List<String> validate() {
		return ['validation works'];		
	}

	Future<void> save() async {

	}

	Future<void> delete() async {

	}

	// do this in the static context while 
	// registration of the model
	Model<Person> get model {
		return Model<Person>(
			save: save,
			validate: validate,
			delete: delete,
		);
	}
}


// extension NumberParsing on String {
//  int parseInt() {
//    return int.parse(this);
//  }
// }
