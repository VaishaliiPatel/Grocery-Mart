// import 'package:GroceryMart/providers/countryData.dart';
import 'package:GroceryMart/providers/facebook_signIn_provider.dart';
import 'package:GroceryMart/screens/LoadingScreen.dart';
// import 'package:GroceryMart/store/Cart/Cart.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import './screens/SplashScreen.dart';
import './screens/OnBording.dart';
import './screens/SignIn.dart';
import './screens/Registration.dart';
import './screens/OTPScreen.dart';
import './screens/LocationScreen.dart';
import './screens/Login.dart';
import './screens/SignUp.dart';
import './screens/HomeSceen.dart';
import './screens/TabBarNavigation.dart';
import './screens/ItemDetail.dart';
import './screens/SearchTab.dart';
import './screens/CategoryScreen.dart';
import './screens/CartScreen.dart';
import './screens/FavouriteScreen.dart';
import './screens/PlaceOrder.dart';
import './screens/OrderFailed.dart';
import './screens/FilterScreen.dart';
import './providers/productProviders.dart';
import './providers/google_signIn_provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Productprovider(),
        ),
        // Provider<Cart>(
        //   create: (_) => Cart(),
        // ),
        ChangeNotifierProvider(
          create: (ctx) => GoogleSignInProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => FacebookSignInProvider(),
        ),
        // ChangeNotifierProvider(
        //   create: (ctx) => CountyProvider(),
        // ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // primarySwatch: new Color(0xffHHGA),
          primaryColor: new Color(0xff53B175),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          buttonTheme: ButtonTheme.of(context).copyWith(
            buttonColor: new Color(0xff53B175),
            minWidth: double.infinity,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            padding: EdgeInsets.all(20),
          ),
          primaryTextTheme: TextTheme(
            bodyText1: TextStyle(
              fontFamily: 'PTSansCaption',
              color: Colors.white,
              fontSize: 17,
            ),
          ),
          textTheme: ThemeData.light().textTheme.copyWith(
                caption: TextStyle(
                  fontFamily: 'PTSansCaption',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                button: TextStyle(color: Colors.white),
              ),
        ),
        home: StreamBuilder(
          stream: FirebaseAuth.instance.onAuthStateChanged,
          builder: (ctx, userSnapShot) {
            final provider =
                Provider.of<GoogleSignInProvider>(ctx, listen: false);

            if (userSnapShot.connectionState == ConnectionState.waiting) {
              return SplashScreen();
            }
            if (userSnapShot.hasData) {
              print("--------------userSnapShotData----------");
              print(userSnapShot.data.toString());
              return TabBarScreen();
            }
            // if (provider.isSigningIn) {
            //   return LoadingScreen();
            // }
            return OnBordingScreen();
          },
        ),
        // home: SplashScreen(),
        routes: {
          SignInScreen.routeName: (ctx) => SignInScreen(),
          Registration.routeName: (ctx) => Registration(),
          OTPScreen.routeName: (ctx) => OTPScreen(),
          LocationScreen.routeName: (ctx) => LocationScreen(),
          LoginScreen.routeName: (ctx) => LoginScreen(),
          SignUpScreen.routeName: (ctx) => SignUpScreen(),
          HomeScreen.routeName: (ctx) => HomeScreen(),
          TabBarScreen.routeName: (ctx) => TabBarScreen(),
          ItemDetailScreen.routeName: (ctx) => ItemDetailScreen(),
          SearchTab.routeName: (ctx) => SearchTab(),
          CategoryScreen.routeNmae: (ctx) => CategoryScreen(),
          CartScreen.routeName: (ctx) => CartScreen(),
          FavouriteScreen.routeName: (ctx) => FavouriteScreen(),
          PlaceOrder.routeName: (ctx) => PlaceOrder(),
          PopupLayout.routeName: (ctx) => PopupLayout(),
          FilterScreen.routeName: (ctx) => FilterScreen(),
          LoadingScreen.routeName: (ctx) => LoadingScreen(),
          OnBordingScreen.oruteName: (ctx) => OnBordingScreen()
        },
      ),
    );
  }
}
