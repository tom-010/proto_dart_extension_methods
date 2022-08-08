import 'package:proto_dart_extension_methods/proto_dart_extension_methods.dart';
import 'package:test/test.dart';
import 'package:proto_dart_extension_methods/proto/addressbook.pb.dart';


void main() {

  late Person person;
  late ModelRegistry registry; 

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

	registry = ModelRegistry.instance
		..register(PersonMethods.toModel);

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

  test('implements model interface', () {
	  Model m = registry.toModel(person);
	  expect(m.validate().length, 1);
  });

  test('static methods', () {
	  expect(PersonMethods.getSomeName(), 'tom');
  });

  test('dependency usage', () {

  });
}
