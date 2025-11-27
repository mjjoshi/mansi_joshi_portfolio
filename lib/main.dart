import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/values/app_colors.dart';
import 'package:portfolio/values/app_images.dart';
import 'package:portfolio/values/app_widgets.dart';
import 'package:portfolio/values/strings_name.dart';
import 'package:url_launcher/url_launcher.dart';

//https://wahab-khan.github.io/Abdul-Wahab-Khan/

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (_, __) => const MaterialApp(home: MyHomePage()),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 50.h, bottom: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                /// ----------- Header Section ----------
                AppWidgets.commonTextAvenir("Mansi Joshi", fontSize: AppWidgets.getResponsiveFont(35), fontWeight: FontWeight.w700, color: Colors.black),
                AppWidgets.commonTextAvenir("Senior Software Engineer", fontSize: AppWidgets.getResponsiveFont(12), fontWeight: FontWeight.w400, color: AppColors.colorPrimary),
                SizedBox(height: 30.h),

                Container(
                  padding: EdgeInsetsGeometry.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5, spreadRadius: 1, offset: Offset(0, 0))],
                  ),
                  child: Column(
                    children: [
                      AppWidgets.commonTextAvenir("About me", fontSize: AppWidgets.getResponsiveFont(20), fontWeight: FontWeight.w700, color: Colors.black),
                      SizedBox(
                        width: 50.w,
                        child: AppWidgets.divider(colors: AppColors.colorPrimary),
                      ),
                      SizedBox(height: 10.h),
                      setAboutMe(),
                    ],
                  ),
                ),
                SizedBox(height: 30.h),
                skillsSection(),
                SizedBox(height: 30.h),
                EmploymentsSection(),

                SizedBox(height: 30.h),
                footerSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget EmploymentsSection() {
    return Container(
      padding: EdgeInsetsGeometry.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5, spreadRadius: 1, offset: Offset(0, 0))],
      ),

    );
  }





  Widget skillsSection() {
    return Container(
      padding: EdgeInsetsGeometry.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5, spreadRadius: 1, offset: Offset(0, 0))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: AppWidgets.commonTextAvenir("Technical Skills", fontSize: AppWidgets.getResponsiveFont(20), fontWeight: FontWeight.w700, color: Colors.black),
          ),
          Center(
            child: SizedBox(
              width: 50.w,
              child: AppWidgets.divider(colors: AppColors.colorPrimary),
            ),
          ),
          SizedBox(height: 10.h),
          _skillItem("Programming Languages", "Dart, Kotlin, Basic of Java"),
          _skillItem("Mobile Development", "Flutter, Native Android Development, UI Integration, Custom Widgets, Animations"),
          _skillItem("State Management", "GetX, Bloc, Provider"),
          _skillItem("Architectures", "MVVM, MVC, CLEAN Architecture"),
          _skillItem("API & Networking", "REST API Integration (Dio, Http, Retrofit, Volley), Swagger, Postman, FFMPEG Integration"),
          _skillItem("Database & Storage", "SQFLite,SQLite,Room Database, Firebase Database, Shared Preferences"),
          _skillItem("Firebase Services", "Firebase Authentication, FCM Push Notifications, Firebase Analytics, FlutterFire , Firebase Crashlytics, Firebase Remote Config"),
          _skillItem("Payments", "Stripe Integration (FPX, Google Pay, Apple Pay), In-app Purchases , Razorpay"),
          _skillItem("Version Control", "GitHub, GitLab"),
          _skillItem("Tools & Platforms", "Android Studio, VS Code, Trello, Slack, Basecamp, Asana, Redmine, Zeplin, ClickUp, Figma, Adobe XD, Miro Board"),
          _skillItem("Other Skills", "Prototyping, Wireframing, Code Review, Client Communication"),
        ],
      ),
    );
  }

  Widget _skillItem(String title, String skills) {
    return Padding(
      padding: EdgeInsets.only(bottom: 5.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppWidgets.commonTextAvenir("${title}: ", fontSize: AppWidgets.getResponsiveFont(12), fontWeight: FontWeight.w700, color: Colors.black),
          AppWidgets.commonTextAvenir(skills, fontSize: AppWidgets.getResponsiveFont(10), fontWeight: FontWeight.w500, color: AppColors.blackFont),
        ],
      ),
    );
  }

  Widget footerSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppWidgets.commonTextAvenir("Get In Touch", fontSize: AppWidgets.getResponsiveFont(30), fontWeight: FontWeight.w700, color: Colors.black),
        SizedBox(
          width: 50.w,
          child: AppWidgets.divider(colors: AppColors.colorPrimary),
        ),

        SizedBox(height: 20.h),

        /// Email Row
        GestureDetector(
          onTap: _launchEmail,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.email, color: Colors.black),
              SizedBox(width: 10),
              AppWidgets.commonTextAvenir("Joshimansi669@gmail.com", fontSize: AppWidgets.getResponsiveFont(16), color: AppColors.blackFont),
            ],
          ),
        ),

        SizedBox(height: 12),

        /// Phone Row
        GestureDetector(
          onTap: _launchPhone,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.phone, color: Colors.black),
              SizedBox(width: 10),
              AppWidgets.commonTextAvenir("+91 9723555363", fontSize: AppWidgets.getResponsiveFont(16), color: AppColors.blackFont),
            ],
          ),
        ),

        SizedBox(height: 12),

        /// LinkedIn Row
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                _launchLinkedIn();
              },
              child: Image.asset(AppImage.icLinkedin, fit: BoxFit.contain, height: 40.h),
            ),
            SizedBox(width: 10.w),
            GestureDetector(
              onTap: () {
                _launchLinkedIn();
              },
              child: Image.asset(AppImage.icGithub, fit: BoxFit.contain, height: 40.h),
            ),
          ],
        ),

        SizedBox(height: 40.h),
      ],
    );
  }

  Widget setAboutMe() {
    return RichText(
      textAlign: TextAlign.start,
      text: TextSpan(
        style: TextStyle(fontSize: AppWidgets.getResponsiveFont(12), color: AppColors.blackFont, fontFamily: "Avenir", fontWeight: FontWeight.normal),
        children: [
          TextSpan(
            text: "I am a mobile app developer with over ",
            style: TextStyle(fontFamily: StringNames.fontFamily, fontSize: AppWidgets.getResponsiveFont(11)),
          ),
          TextSpan(
            text: "8 years ",
            style: TextStyle(fontWeight: FontWeight.bold, fontFamily: StringNames.fontFamily, fontSize: AppWidgets.getResponsiveFont(13)),
          ),
          TextSpan(
            text: "of experience creating smooth, reliable, and user-friendly mobile applications. I have worked on both ",
            style: TextStyle(fontFamily: StringNames.fontFamily, fontSize: AppWidgets.getResponsiveFont(11)),
          ),
          TextSpan(
            text: "native Android apps and cross-platform apps using Flutter",
            style: TextStyle(fontWeight: FontWeight.bold, fontFamily: StringNames.fontFamily, fontSize: AppWidgets.getResponsiveFont(13)),
          ),
          TextSpan(
            text:
                ", turning ideas into real products that people use every day. I focus on clean architecture, robust code quality, and exceptional user experiences.\nThroughout my career, I have led multiple teams to deliver scalable mobile solutions, ensuring high standards in architecture, performance, and usability. I am passionate about leveraging modern technologies to solve complex problems and mentoring the next generation of developers. My goal is to build products that make an impact, add real value, and provide users with a consistent and enjoyable experience from start to finish.",

            style: TextStyle(fontFamily: StringNames.fontFamily, fontSize: AppWidgets.getResponsiveFont(11)),
          ),
        ],
      ),
    );
  }

  Future<void> _launchEmail() async {
    final Uri emailUri = Uri(scheme: 'mailto', path: 'Joshimansi669@gmail.com');
    await launchUrl(emailUri);
  }

  Future<void> _launchPhone() async {
    final Uri phoneUri = Uri(scheme: 'tel', path: '+919723555363');
    await launchUrl(phoneUri);
  }

  Future<void> _launchLinkedIn() async {
    final Uri linkedInUri = Uri.parse('https://www.linkedin.com/in/your-profile-here');
    await launchUrl(linkedInUri);
  }
}
