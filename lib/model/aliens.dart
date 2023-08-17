
  import 'package:kc_tv_app/model/item.dart';

class Aliens{

    List<Item> items = <Item>[];

    Aliens();

    Aliens.fromJsonList( List<dynamic> jsonList ){
      //if (jsonList == null ) return;

      for (var dato in jsonList){
        final item =  Item.fromJsonMap(dato);
        items.add(item);
      }
    }

}