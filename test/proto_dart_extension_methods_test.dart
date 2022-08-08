import 'package:proto_dart_extension_methods/proto_dart_extension_methods.dart';
import 'package:test/test.dart';
import 'package:proto_dart_extension_methods/proto/addressbook.pb.dart';


void main() {

  late Person person;

  setUp(() {
	person = Person(
		name: 'Tom',
		id: 123,
		email: 'tom@mail.de',
		phones: [
			Person_PhoneNumber(
				number: '08304 123',
				type: Person_PhoneType.HOME
			)
		]
	);

  });

  test('getter', ()  {
	expect(person.greeting, 'Hello Tom');
  });

  test('setter', () {
	person.birthYear = 1994;
	expect(person.name, 'Tom 1994');
  });

  test('normal function call', () {
	int res = person.idPlusOne();
	expect(person.id, 124);
	expect(res, 124);
  });
}
