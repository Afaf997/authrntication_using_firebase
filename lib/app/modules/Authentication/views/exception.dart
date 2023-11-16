class SignUpWithEmailPasswordFailure{
  final String message;

  const SignUpWithEmailPasswordFailure([this.message = "An unknown error occurred"]);

  factory SignUpWithEmailPasswordFailure.code(String code){
    switch(code){
      case "weak-password":
      return const SignUpWithEmailPasswordFailure("Please enter a strong password");
       case "invalid-email":
      return const SignUpWithEmailPasswordFailure("email is not valid or badlly formatted");
       case "email-already-in-use":
      return const SignUpWithEmailPasswordFailure("an accound already exist for that email");
      default:
      return const SignUpWithEmailPasswordFailure();

    }
  }


}