final List database = [];

void main(List<String> arguments) {
  final result = register({
    'email': 'abc@abc.com',
    'password': '123456',
    'name': 'John Doe',
  });

  result.call();
  // print(result.call());
  print(database);
}

Function register(user) {
  return saveDb(user, (user) {
    return sendEmail(user, (user) {
      return getResult(user);
    });
  });
}

Function saveDb(user, callback) {
  print('saving $user to db');
  return callback(user);
}

Function sendEmail(user, callback) {
  print('sending email to $user');
  database.add(user);
  return callback(user);
}

Function getResult(user) {
  return () => 'success register $user';
}
