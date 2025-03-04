import 'package:flutter/material.dart';
import 'package:celec/instgram_page.dart';
import 'package:celec/user_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: InstagramProfile(
    userData: UserData(
    username: 'Celec',
      displayName: 'Flutter Developer',
      bio: 'Welcome to my Flutter journey!\nBuilding amazing apps\nflutter.dev',
      profilePicUrl: 'https://picsum.photos/200',
      posts: 42,
      followers: 1234,
      following: 321,
      postImages: List.generate(
        20,
            (index) => 'https://picsum.photos/200?random=$index',
      ),
      storyHighlights: List.generate(
        20,
            (index) => 'https://picsum.photos/200?random=${index + 100}',
      ),
    ),
    ),
    );
  }
}
