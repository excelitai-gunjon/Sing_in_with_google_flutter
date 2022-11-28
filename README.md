# Authentication using google with firebase

Read my article in Medium : https://medium.com/@bayazid.excelitai/flutter-google-sign-in-using-firebase-7a54c1dd2e83

For authenticating users on the application, Firebase provides many simple effective back-end services, and user interface libraries.

This article will demonstrate how to set up the Flutter app to implement Google Sign-In with Firebase Authentication.

## Follow the steps :

## 1. Create a new flutter project.
## 2. Add these packages in your project pubspec.yaml file.

i)firebase core

https://pub.dev/packages/firebase_core


ii)firebase auth

https://pub.dev/packages/firebase_auth


iii)google sign in

https://pub.dev/packages/google_sign_in


## 3. Open your firebase console account.

click here :

https://firebase.google.com/


## 4. Add your project by simply clicking Add Project Button and following the firebase recommended instruction just click up to next.

Requirement :

i) project name

ii) project package name

iii) SHA1 key


So where do you get the project package name? From your project folder

android/app/src/main/AndroidManifest.xml

your package name will be look like : package=”com.example.contactapp”





Where do you get your SHA1 key ?

you have to generate this key by executing a simple command in your project terminal.


For Mac :

keytool -list -v -keystore ~/.android/debug.keystore -alias androiddebugkey -storepass android -keypass android


Fow Windows :

keytool -list -v -keystore C:\Users\<Your User Name>\.android\debug.keystore -alias androiddebugkey


Download the json file from firebase and put this file in your project app folder.


Then add all the dependencies in your project build-gradle file following the firebase documentation.


## 5. From the firebase authentication dashboard just enable the google sign in provider.

Wohooooo! You are done with firebase. Now lets build your login ui and write some login functions.


## 6. In your project lib folder you might create three different dart file.

i) login_screen.dart : For your login screen ui design.

ii) home_screen.dart : After successful login, the user will redirect in this screen.

iii) google_auth.dart : This will be your helper class which will contain logic functions for sign in and sign out users.


## 7. Create a button named as Sign in with google in your login_screen file. Then call the sign in function from its onPressed method.


Sign in Function :

final _auth = FirebaseAuth.instance;
final _googleSignIn = GoogleSignIn();

signInWithGoogle() async {
try {
final GoogleSignInAccount? googleSignInAccount =
await _googleSignIn.signIn();
if (googleSignInAccount != null) {
final GoogleSignInAuthentication googleSignInAuthentication =
await googleSignInAccount.authentication;
final AuthCredential authCredential = GoogleAuthProvider.credential(
accessToken: googleSignInAuthentication.accessToken,
idToken: googleSignInAuthentication.idToken);
await _auth.signInWithCredential(authCredential);
}
} on FirebaseAuthException catch (e) {
print(e.message);
throw e;
}
}

Signout Function :

googleSignOut() async {
await _auth.signOut();
await _googleSignIn.signOut();
}

## 8. After completion of the sign in process you may show the user information such as user profile photo, user email, user name in your home_screen. Process will be look like,

Image.network(FirebaseAuth.instance.currentUser!.photoURL!),
Text(“${FirebaseAuth.instance.currentUser!.displayName}”),
Text(“${FirebaseAuth.instance.currentUser!.email}”),

Notes :

When you are using firebase you might face some error in your app level build-gradle file. For solve all the issue in your build-gradle file,

Make changes in,

compileSdkVersion 31

minSdkVersion 22

targetSdkVersion 31

Then if you are using android studio go to

File>Project structure>select android SDK 31>click on problems>again select SDK version 31 .

then apply all changes and save.

Hopefully you can overcome the firebase gradle-build error by doing this.






# Authentication using google without firebase

Read my article in medium:
https://medium.com/@bayazid.excelitai/flutter-google-sign-in-without-firebase-254648b7c71f

For authenticating users on the application without firebase it’s pretty simple to do.

This article will demonstrate how to set up the Flutter app to implement Google Sign-In without Firebase Authentication.

Follow the steps :

Open your google cloud console account.
click here : https://console.cloud.google.com

## 2. At first add your project with a name then select your project.

## 3. Search for OAuth consent screen and fill up all the information then by clicking next complete the process.


## 4.Create credentials.

Requirement :


i) project name

ii) project package name

iii) SHA1 key



So where do you get the project package name? From your project folder

android/app/src/main/AndroidManifest.xml

your package name will be look like : package=”com.example.demoapp”


Where do you get your SHA1 key ?

you have to generate this key by executing a simple command in your project terminal.


For Mac :

keytool -list -v -keystore ~/.android/debug.keystore -alias androiddebugkey -storepass android -keypass android


Fow Windows :

keytool -list -v -keystore C:\Users\<Your User Name>\.android\debug.keystore -alias androiddebugkey


## 5. Create a new flutter project.

## 6. Add these packages in your project pubspec.yaml file.

i)google sign in

https://pub.dev/packages/google_sign_in


## 7. You have to generate a keystore.jks file and then put it in your project app folder.

How to generate a keystore.jks file?

For Mac :

keytool -genkey -v -keystore ~/upload-keystore.jks -keyalg RSA -keysize 2048 -validity 10000 -alias upload


For Windows:

keytool -genkey -v -keystore %userprofile%\upload-keystore.jks -storetype JKS -keyalg RSA -keysize 2048 -validity 10000 -alias upload

Then add proper information about your jks file in app level build-gradle before buildTypes provide your KeyAlias,password and file name such like this,

signingConfigs {
debug {
keyAlias ‘upload’
keyPassword ‘12345678’
storeFile file(‘upload-keystore.jks’)
storePassword ‘12345678’
}
}

## 8. In your project lib folder you might create different dart files.

i) login_screen.dart : For your login screen ui design.

ii) home_screen.dart : After successful login, the user will redirect to this screen.

## 9. Create a button named as Sign in with google in your login_screen file. Then call the sign in function from its onPressed method.


Sign in Function :

googleLogin() async{
GoogleSignIn _googleSignIn = GoogleSignIn();
try {
var userData= await _googleSignIn.signIn();
if(userData!=null){
Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen(
name: result.displayName,
email: result.email,
photo: result.photoUrl,
)));
}

print(result);
} catch (error) {
print(error);
}
}

Signout Function :

googleSignOut() async {
await _googleSignIn.disconnect();
}

## 10. After completion of the sign in process you may show the user information such as user id,profile photo, user email, user name in your home_screen.

Notes :

When you are using firebase you might face some error in your app level build-gradle file. For solve all the issue in your build-gradle file,


Make changes in,

compileSdkVersion 31

minSdkVersion 22

targetSdkVersion 31

Then if you are using android studio go to

File>Project structure>select android SDK 31>click on problems>again select SDK version 31 .


then apply all changes and save.


Hopefully you can overcome the firebase gradle-build error by doing this.



