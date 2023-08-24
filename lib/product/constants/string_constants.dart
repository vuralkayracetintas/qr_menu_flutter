import 'package:firebase_ui_localizations/firebase_ui_localizations.dart';
import 'package:flutter/material.dart';

@immutable
class StringConstants {
  const StringConstants._();
  static const String brandName = 'Pizza 2 Go';
}

class LabelOverrides extends DefaultLocalizations {
  const LabelOverrides();

  @override
  String get emailInputLabel => 'E-mail adresinizi giriniz';

  @override
  String get passwordInputLabel => 'Şifrenizi giriniz';

  @override
  String get emailIsRequiredErrorText => 'E-mail adresi boş bırakılamaz';

  @override
  String get isNotAValidEmailErrorText => 'Geçerli bir e-mail adresi giriniz';

  @override
  String get userNotFoundErrorText => 'Kullanıcı bulunamadı';

  @override
  String get wrongOrNoPasswordErrorText => 'Şifre yanlış veya boş';

  @override
  String get signInActionText => 'Giriş Yap';

  @override
  String get passwordIsRequiredErrorText => 'Şifre boş bırakılamaz';

  @override
  String get forgotPasswordButtonLabel => 'Şifremi Unuttum';

  @override
  String get forgotPasswordViewTitle => 'Şifremi Unuttum';

  @override
  String get resetPasswordButtonLabel => 'Şifremi Sıfırla';

  @override
  String get verifyItsYouText => 'Hesabınızı doğrulayın';

  @override
  String get goBackButtonLabel => 'Geri';

  @override
  String get passwordResetEmailSentText => 'Şifre sıfırlama e-maili gönderildi';

  @override
  String get forgotPasswordHintText =>
      'E-posta adresinizi girin, size şifrenizi sıfırlamanız için bir bağlantı göndereceğiz';
}
