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

	static final ModelRegistry instance = ModelRegistry();
	
	register<T extends GeneratedMessage>(Model<T> Function(T) toModel) {
		_entries[T] = toModel;
	}

	Model<T> toModel<T extends GeneratedMessage>(T instance) {
		final fn = _entries[instance.runtimeType];
		assert(fn != null, 'there was no model builder registered for ${instance.runtimeType}');
		return fn(instance) as Model<T>;
	}
}

///////////////


extension PersonMethods on Person {

	static String _nickname = "";

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

	static Model<Person> toModel(Person p) {
		return Model<Person>(
			save: p.save,
			validate: p.validate,
			delete: p.delete,
		);
	}

	static String getSomeName() {
		return 'tom';
	}

}


