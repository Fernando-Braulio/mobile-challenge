import 'package:floor/floor.dart';

abstract class IRepositoryDaoInterface<Table> {
  @insert
  Future<int> insertItem(Table item);

  @update
  Future<int> updateitem(Table item);

  @delete
  Future<int> deleteItem(Table item);
}
