class Strings {
  Strings._();

  static const String appName = 'Firebase Auth';

  static const String welcome = 'Welcome';
  static const String welcomeSubtitle = "Let's start exploring \n$appName";
  static const String getStartedButton = 'Get Started';
  static const String signinButton = 'Sign in to firebase auth';

  static const String account = 'Would you like to create an account?';
  static const String accountInfo =
      'With an account, your data will be securely saved and backed up, allowing you to access it from multiple devices.';
  static const String signupButton = 'Sign up with email';
  static const String skipButton = 'Skip for now';

  static const String login = 'Sign In';
  static const String labelTextEmail = 'Email';
  static const String hintTextEmail = 'example@mail.com';
  static const String labelTextPassword = 'Password';
  static const String hintTexPassword = 'Enter password';
  static const String signinEmailButton = 'Sign in with email';

  static const String signup = 'Create new account';
  static const String labelTextName = 'Name';
  static const String hintTextName = 'Enter your name.';

  static const String haveAnAccount = 'Have an account? Sign in';
  static const String createAnAccount = 'Dont have an account? Sign up';
  static const String forgotPassword = 'Forgot password?';
  static const String forgotPasswordButton = 'Submit';

  //Error messages
  static const String emailRequiredError = 'Enter an email';
  static const String emailValidationError =
      'The email is not a valid email address.';

  static const String firebaseEmailNotFoundError =
      'There is no user record corresponding to this identifier. The user may have been deleted.';
  static const String emailNotFoundError =
      'Email not found! Please create an account.';
  static const String emailAlreadyInUsedError =
      'The email address is already in use by another account.';

  static const String passwordRequiredError = 'Enter a password.';
  static const String passwordShortError = 'Minimun length of password is 6.';
  static const String passwordInvalidError = 'The password is invalid.';

  static const String nameRequiredError = 'Enter your name';
  static const String nameShortError =
      'Name must be at least 2 characters long';
  static const String nameLongError =
      'Name must be less than 30 characters long';

  static const String regExp =
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$";
}
