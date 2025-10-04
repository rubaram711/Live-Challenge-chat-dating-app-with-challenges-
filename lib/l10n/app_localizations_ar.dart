import 'app_localizations.dart';

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get hello => 'مرحباً';

  @override
  String get agree => 'موافقة';

  @override
  String get disagree => 'رفض';

  @override
  String get login => 'تسجيل الدخول';

  @override
  String get wait => 'انتظر قليلاً من فضلك';

  @override
  String get google_login_btn => 'تسجيل الدخول باستخدام Google';

  @override
  String get apple_login_btn => 'تسجيل الدخول باستخدام Apple';

  @override
  String get google_login_explanation => 'قم بالضغط على الزر واختر حساب Google لتسجيل الدخول من خلاله';

  @override
  String get apple_login_explanation => 'قم بالضغط على الزر واختر حساب iCloud لتسجيل الدخول من خلاله';

  @override
  String get users => 'المستخدمين';

  @override
  String get notifications => 'الطلبات';

  @override
  String get chat => 'الدردشة';

  @override
  String get support => 'الدعم';

  @override
  String get profile => 'الملف الشخصي';

  @override
  String get search => 'بحث';

  @override
  String get save => 'حقظ';

  @override
  String get cancel => 'إلغاء';

  @override
  String get update_profile => 'تعديل الملف الشخصي';

  @override
  String get enter_photo => 'اختر صورة جديدة';

  @override
  String get gallery => 'المعرض';

  @override
  String get camera => 'الكاميرا';

  @override
  String get accept_challenges => 'قبول التحديات';

  @override
  String get not_accept_challenges => 'عدم قبول التحديات';

  @override
  String get accept_adult_challenges => 'قبول تحديات +18';

  @override
  String get not_accept_adult_challenges => 'عدم قبول تحديات +18';

  @override
  String get username => 'اسم المستخدم';

  @override
  String get bio => 'السيرة الذاتية';

  @override
  String get unspecified_bio => 'لم تقف بإضافة سيرة ذاتية بعد';

  @override
  String get country => 'البلد';

  @override
  String get unspecified_country => 'البلد غير محدد';

  @override
  String get phone => 'رقم الموبايل';

  @override
  String get phone10Digits => 'يجب ان يتكون رقم الهاتف من 10 ارقام';

  @override
  String get unspecified_phone => 'رقم الهاتف غير محدد';

  @override
  String get updated_successfully => 'تم التعديل بنجاح';

  @override
  String get updated_failed => 'فشل التعديل';

  @override
  String get filter => 'عرض المستخدمين الذين يقبلون تحديات +18 فقط';

  @override
  String get points => 'نقاط / 10د';

  @override
  String get point => 'نقطة';

  @override
  String get request_adult => 'تحدي +18';

  @override
  String get request_challenge_type => 'نوع التحدي';

  @override
  String get audio => 'صوت';

  @override
  String get video => 'فيديو';

  @override
  String get send_request => 'إرسال الطلب';

  @override
  String get challenge_award => 'جائزة التحدي';

  @override
  String get withdraw => 'سحب';

  @override
  String get deposit => 'إيداع';

  @override
  String get deposited_amount => 'اختر المبلغ المراد ايداعه';

  @override
  String get otherwise => 'غير ذلك';

  @override
  String get sent_successfully => 'تم إرسال الطلب بنجاح';

  @override
  String get sent_field => 'حدث خطأ ما, لم يتم إرسال الطلب';

  @override
  String get accept_successfully => 'تمت الموافقة على الطلب';

  @override
  String get accept_field => 'حدث خطأ ما';

  @override
  String get error => 'حدث خطأ ما';

  @override
  String receive_request(Object type, Object name, Object points) {
    return 'وصلك طلب تحدي $type من $name بقيمة $points نقطه';
  }

  @override
  String receive_accept(Object type, Object name, Object points) {
    return 'قبول طلب التحدي $type من $name بقيمة $points نقاط';
  }
}
