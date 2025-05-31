import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'di.config.dart'; // هذا الملف يُولد تلقائياً

// @injectable    وظيفتها: تسجل الكلاس كـ dependency عاديّة يمكن حقنها (injected).  ex : api service

//singleton وظيفتها: تسجل الكلاس كـ singleton يعني نسخة واحدة من الكلاس موجودة طول عمر التطبيق.

//lazySingleton 🟢 الأفضل:  (لأنك غالبًا محتاج تنشئ كذا Cubit أو Bloc بطرق مختلفة)

final getIt = GetIt.instance;

@InjectableInit(initializerName: 'init') // ← دي مهمة
void configureDependencies() => getIt.init(); // ← يبقى كده شغالة مظبوط
