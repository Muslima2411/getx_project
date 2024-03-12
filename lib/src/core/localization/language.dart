import 'package:get/get.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'hello': 'Hello World English',
        },
        'uz_UZ': {
          'hello': 'qalesane',
        },
        'ru_RU': {
          'hello': 'привет',
        },
      };
}
