class CustomerTable {
  static const String tableName = 'customers';
  static const String columnId = 'id';
  static const String columnFName = 'firstName';
  static const String columnLName = 'lastName';
  static const String columnDob = 'birthday';
  static const String columnAddress = 'address';
  static const String columnContacts = 'contacts';

  static String create() {
    return "CREATE TABLE $tableName (" +
        "$columnId INTEGER PRIMARY KEY, " +
        "$columnFName VARCHAR(70), " +
        "$columnLName VARCHAR(70), " +
        "$columnDob VARCHAR(30), " +
        "$columnAddress TEXT, " +
        "$columnContacts TEXT" +
        ")";
  }
}