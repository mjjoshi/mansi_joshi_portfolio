import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/values/app_colors.dart';
import 'package:portfolio/values/app_images.dart';
import 'package:portfolio/values/app_widgets.dart';
import 'package:portfolio/values/fadeIntext.dart';
import 'package:portfolio/values/gradient_button.dart';
import 'package:portfolio/values/project_model.dart';
import 'package:portfolio/values/slide_animation.dart';
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
  final ScrollController _scrollController = ScrollController();
  final GlobalKey projectKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 50.h, bottom: 20.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    LayoutBuilder(
                      builder: (context, constraints) {
                        bool isMobile = constraints.maxWidth < 600;

                        return isMobile
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // text
                                  FadeInText(child: AppWidgets.commonTextAvenir("Mansi Joshi", fontSize: 35, fontWeight: FontWeight.w700)),
                                  AppWidgets.commonTextAvenir("Senior Software Engineer", fontSize: 12),
                                  SizedBox(height: 20),
                                  // buttons
                                  Wrap(
                                    spacing: 10,
                                    children: [
                                      GradientButton(text: "Projects", onTap: () {}),
                                      GradientButton(text: "Resume", onTap: () {}),
                                    ],
                                  ),
                                ],
                              )
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  // text section
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      FadeInText(child: AppWidgets.commonTextAvenir("Mansi Joshi", fontSize: 35, fontWeight: FontWeight.w700)),
                                      AppWidgets.commonTextAvenir("Senior Software Engineer", fontSize: 12),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      GradientButton(
                                        text: "Projects",
                                        onTap: () {
                                          Scrollable.ensureVisible(projectKey.currentContext!, duration: Duration(milliseconds: 800), curve: Curves.easeInOut);
                                        },
                                      ),
                                      SizedBox(width: 10),
                                      GradientButton(text: "Resume", onTap: () {}),
                                    ],
                                  ),
                                ],
                              );
                      },
                    ),

                    SizedBox(height: 30.h),
                    SlideAnimation(
                      child: Container(
                        padding: EdgeInsetsGeometry.all(10),
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10.r), boxShadow: commonLightShadow()),
                        child: Column(
                          children: [
                            AppWidgets.commonTextAvenir("About me", fontSize: AppWidgets.getResponsiveFont(20), fontWeight: FontWeight.w700, color: AppColors.colorPrimary),
                            SizedBox(
                              width: 50.w,
                              child: AppWidgets.divider(colors: AppColors.colorPrimary),
                            ),
                            SizedBox(height: 10.h),
                            setAboutMe(),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 30.h),
                    skillsSection(),
                    SizedBox(height: 30.h),
                    employmentSection(),
                    SizedBox(height: 30.h),
                    educationSection(),
                    SizedBox(height: 30.h),
                    projectSection(),
                    SizedBox(height: 30.h),
                  ],
                ),
              ),
              footerSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget projectSection() {
    return SlideAnimation(
      child: Container(
        key: projectKey,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10.r), boxShadow: commonLightShadow()),
        child: Column(
          children: [
            Center(
              child: AppWidgets.commonTextAvenir("My Projects", fontSize: AppWidgets.getResponsiveFont(20), fontWeight: FontWeight.w700, color: AppColors.colorPrimary),
            ),
            Center(
              child: SizedBox(
                width: 10.w,
                child: AppWidgets.divider(colors: AppColors.colorPrimary),
              ),
            ),
            LayoutBuilder(
              builder: (_, constraints) {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.all(8.r),
                  itemCount: projects.length,
                  itemBuilder: (context, index) {
                    return projectCard(projects[index]);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget projectCard(ProjectModel project) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = constraints.maxWidth < 600; // check mobile width

        return Container(
          margin: EdgeInsets.only(bottom: 5.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5.r),
            border: Border.all(color: AppColors.colorWhiteLight),
          ),
          padding: EdgeInsets.all(8.r),

          child: isMobile
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// IMAGE
                    Center(
                      child: Image.asset(project.image, fit: BoxFit.contain, height: 120.h),
                    ),
                    SizedBox(height: 8.h),

                    /// TITLE
                    AppWidgets.commonTextAvenir(project.title, maxLines: 2, fontSize: AppWidgets.getResponsiveFont(18), fontWeight: FontWeight.w700, color: AppColors.blackFont),
                    SizedBox(height: 6.h),
                    buildTechChips(project.technology),
                    SizedBox(height: 6.h),

                    /// SYNOPSIS
                    AppWidgets.commonTextAvenir(project.synopsis, maxLines: 9, fontSize: AppWidgets.getResponsiveFont(10), fontWeight: FontWeight.w500, color: AppColors.blackFont),
                    SizedBox(height: 8.h),

                    /// BUTTON CENTERED
                    Center(
                      child: GradientButton(
                        text: "View Details",
                        onTap: () {
                          _launchLinks(project.link);
                        },
                      ),
                    ),
                  ],
                )
              /// DESKTOP + WEB LAYOUT (your original row)
              : Row(
                  children: [
                    Image.asset(project.image, fit: BoxFit.contain, height: 130.h),
                    SizedBox(width: 3.w),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppWidgets.commonTextAvenir(project.title, maxLines: 2, fontSize: AppWidgets.getResponsiveFont(18), fontWeight: FontWeight.w700, color: AppColors.blackFont),
                          SizedBox(height: 6.h),

                          buildTechChips(project.technology),
                          SizedBox(height: 6.h),

                          AppWidgets.commonTextAvenir(project.synopsis, maxLines: 9, fontSize: AppWidgets.getResponsiveFont(10), fontWeight: FontWeight.w500, color: AppColors.blackFont),
                        ],
                      ),
                    ),

                    SizedBox(width: 3.w),

                    Center(
                      child: GradientButton(
                        text: "View Details",
                        onTap: () {
                          _launchLinks(project.link);
                        },
                      ),
                    ),
                  ],
                ),
        );
      },
    );
  }

  Widget buildTechChips(String techString) {
    // Split technologies by comma
    List<String> techList = techString.split(",").map((e) => e.trim()).toList();
    return Wrap(
      spacing: 6,
      runSpacing: 6,
      children: techList.map((tech) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(5.r),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: AppWidgets.commonTextAvenir(tech, maxLines: 9, fontSize: AppWidgets.getResponsiveFont(10), fontWeight: FontWeight.w600, color: AppColors.blackFont),
        );
      }).toList(),
    );
  }

  List<BoxShadow> commonLightShadow({double opacity = 0.30, double blur = 2, double spread = 0.3, Offset offset = const Offset(0, 0)}) {
    return [BoxShadow(color: AppColors.colorPrimaryLight.withOpacity(opacity), blurRadius: blur, spreadRadius: spread, offset: offset)];
  }

  Widget educationSection() {
    return SlideAnimation(
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10.r), boxShadow: commonLightShadow()),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: AppWidgets.commonTextAvenir("Education", fontSize: AppWidgets.getResponsiveFont(20), fontWeight: FontWeight.w700, color: AppColors.colorPrimary),
            ),
            Center(
              child: SizedBox(
                width: 10.w,
                child: AppWidgets.divider(colors: AppColors.colorPrimary),
              ),
            ),
            SizedBox(height: 20.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Wrap(
                        children: [
                          AppWidgets.commonTextAvenir("BE in Computer Engineering", fontSize: AppWidgets.getResponsiveFont(12), fontWeight: FontWeight.w700, color: Colors.black),
                          AppWidgets.commonTextAvenir(" (2011 - 2013)", fontSize: AppWidgets.getResponsiveFont(10), fontWeight: FontWeight.w600, color: AppColors.blackFont),
                        ],
                      ),
                      SizedBox(height: 6.h),
                      AppWidgets.commonTextAvenir("Gujarat Technological University (CGPA - 8.02)", fontSize: AppWidgets.getResponsiveFont(9), fontWeight: FontWeight.w500, color: AppColors.blackFont, maxLines: 3),
                    ],
                  ),
                ),
                Container(
                  width: 1,
                  height: 60.h,
                  color: Colors.grey.shade400,
                  margin: EdgeInsets.symmetric(horizontal: 5.w),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Wrap(
                        children: [
                          AppWidgets.commonTextAvenir("HSCB", fontSize: AppWidgets.getResponsiveFont(12), fontWeight: FontWeight.w700, color: Colors.black),
                          AppWidgets.commonTextAvenir(" (2011 - 2013)", fontSize: AppWidgets.getResponsiveFont(10), fontWeight: FontWeight.w600, color: AppColors.blackFont),
                        ],
                      ),
                      SizedBox(height: 6.h),
                      AppWidgets.commonTextAvenir("Alpha High School (70%)", fontSize: AppWidgets.getResponsiveFont(9), fontWeight: FontWeight.w500, color: AppColors.blackFont, maxLines: 3),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget employmentSection() {
    final jobs = [
      {
        "title": "Sr. Software Engineer",
        "company": "OpenXcell Technolabs Pvt. Ltd",
        "duration": "May 2022 – Present",
        "description":
            "Developed Android & Flutter apps using Kotlin/Dart, integrated UI & APIs, implemented Stripe payments, Agora calls, push notifications, maintained projects individually, handled periodic client communication for updates and feedback, and published apps on the Play Store and App Store.",
      },
      {
        "title": "Android Developer",
        "company": "Whiz Solutions Pvt. Ltd",
        "duration": "May 2020 – May 2022",
        "description": "Led Android projects end-to-end, handled team coordination, managed client communication, ensured clean architecture, optimized performance, and delivered quality releases throughout the app lifecycle.",
      },
      {
        "title": "Jr. Software Engineer",
        "company": "Space-O Infoweb Pvt. Ltd",
        "duration": "Aug 2019 – Apr 2020",
        "description": "Built Android apps in Kotlin, worked on photo/video modules, improved UI/UX and code quality, gathered requirements, and collaborated directly with clients for stable and on-time delivery.",
      },
      {
        "title": "Android Developer",
        "company": "Pixster Studio",
        "duration": "Jul 2017 – Jul 2019",
        "description": "Developed Android apps in Java with clean and reusable code, implemented UI & API features, ensured app stability and performance, and deployed applications on the Google Play Store.",
      },
    ];

    return SlideAnimation(
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10.r), boxShadow: commonLightShadow()),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: AppWidgets.commonTextAvenir("Employment History", fontSize: AppWidgets.getResponsiveFont(20), fontWeight: FontWeight.w700, color: AppColors.colorPrimary),
            ),
            Center(
              child: SizedBox(
                width: 50.w,
                child: AppWidgets.divider(colors: AppColors.colorPrimary),
              ),
            ),
            SizedBox(height: 10.h),
            ...jobs.map((job) {
              return Padding(
                padding: EdgeInsets.only(bottom: 5.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(
                      spacing: 4,
                      runSpacing: 4,
                      children: [
                        AppWidgets.commonTextAvenir("${job['title']} – ${job['company']}", fontSize: AppWidgets.getResponsiveFont(12), fontWeight: FontWeight.w700, color: Colors.black),
                        AppWidgets.commonTextAvenir("(${job['duration']})", fontSize: AppWidgets.getResponsiveFont(10), fontWeight: FontWeight.w600, color: AppColors.blackFont),
                      ],
                    ),

                    SizedBox(height: 4.h),

                    AppWidgets.commonTextAvenir(job['description']!, fontSize: AppWidgets.getResponsiveFont(9), fontWeight: FontWeight.w500, color: AppColors.blackFont, maxLines: 8),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget skillsSection() {
    return SlideAnimation(
      child: Container(
        padding: EdgeInsetsGeometry.all(10),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10.r), boxShadow: commonLightShadow()),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: AppWidgets.commonTextAvenir("Technical Skills", fontSize: AppWidgets.getResponsiveFont(20), fontWeight: FontWeight.w700, color: AppColors.colorPrimary),
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
            _skillItem("API & Networking", "REST API Integration (Dio, Http, Retrofit, Volley),FFMPEG Integration"),
            _skillItem("Database & Storage", "SQFLite,SQLite,Room Database, Firebase Database, Shared Preferences"),
            _skillItem("Firebase Services", "Firebase Authentication, FCM Push Notifications, Firebase Analytics, FlutterFire , Firebase Crashlytics, Firebase Remote Config"),
            _skillItem("Payments", "Stripe Integration (FPX, Google Pay, Apple Pay), In-app Purchases , Razorpay"),
            _skillItem("Version Control", "GitHub, GitLab"),
            _skillItem("Tools & Platforms", "Android Studio, VS Code, Trello, Slack, Basecamp, Asana, Redmine, ClickUp, Figma, Miro Board, ChatGPT, Cursor, Github Copilot, Postman, Swagger"),
            _skillItem("Other Skills", "Prototyping, Wireframing, Code Review, Client Communication, Sprint Planning, Team Collaboration"),
          ],
        ),
      ),
    );
  }

  Widget _skillItem(String title, String skills) {
    return Padding(
      padding: EdgeInsets.only(bottom: 5.h),
      child: Wrap(
        spacing: 4,
        runSpacing: 4,
        children: [
          AppWidgets.commonTextAvenir("$title: ", fontSize: AppWidgets.getResponsiveFont(11), fontWeight: FontWeight.w700, color: Colors.black),
          AppWidgets.commonTextAvenir(skills, fontSize: AppWidgets.getResponsiveFont(10), fontWeight: FontWeight.w500, color: AppColors.blackFont, maxLines: 4),
        ],
      ),
    );
  }

  Widget footerSection() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topRight: Radius.circular(25.r), topLeft: Radius.circular(25.r)),
        gradient: const LinearGradient(
          colors: [
            Color(0xFF000080),
            Color(0xFF0000DC), // Dark blue
            Color(0xFF6666FF), // Light blue
          ],
        ),
      ),

      child: Column(
        spacing: 10.h,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 10.h),
          AppWidgets.commonTextAvenir("Get In Touch", fontSize: AppWidgets.getResponsiveFont(25), fontWeight: FontWeight.w700, color: Colors.white),
          SizedBox(
            width: 20.w,
            child: AppWidgets.divider(colors: AppColors.colorWhite),
          ),

          /// Email Row
          GestureDetector(
            onTap: _launchEmail,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.email, color: Colors.white, size: 25.r),
                SizedBox(width: 2.w),
                AppWidgets.commonTextAvenir("Joshimansi669@gmail.com", fontWeight: FontWeight.w600, fontSize: AppWidgets.getResponsiveFont(16), color: AppColors.colorWhite),
              ],
            ),
          ),

          /// Phone Row
          GestureDetector(
            onTap: _launchPhone,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.phone, color: Colors.white, size: 25.r),
                SizedBox(width: 2.w),
                AppWidgets.commonTextAvenir("+91 9723555363", fontWeight: FontWeight.w600, fontSize: AppWidgets.getResponsiveFont(16), color: AppColors.colorWhite),
              ],
            ),
          ),

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
      ),
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

  final List<ProjectModel> projects = [
    ProjectModel(
      title: "Payday Fund",
      technology: "Flutter, NodeJS, ReactJS, My SQL",
      synopsis:
          "Payday is an Earned Wage Access app that lets employees access a portion of their earned salary before payday.It provides instant withdrawals with transparent, non-loan fees deducted on the next salary.Users learn budgeting and saving through short, gamified financial modules.Smart algorithms ensure responsible usage and secure integration with employer payroll systems.",
      image: AppImage.icPayday,
      link: '',
    ),
    ProjectModel(
      title: "RespondSVP – Envitely",
      technology: "Flutter, NodeJS, ReactJS, MongoDB",
      synopsis:
          "A complete event management platform for Hosts, Co-hosts, Guests, and Admins.Users can create, manage, and track events with invitations and detailed listings.Guests receive event invites, view details, and participate seamlessly.The admin panel manages all users, events, and platform settings efficiently.",
      image: AppImage.icEnvitely,
      link: 'https://play.google.com/store/apps/details?id=com.envitely.eventmanager',
    ),
    ProjectModel(
      title: "Vidola",
      technology: "Flutter, NodeJS, ReactJS, MongoDB",
      synopsis:
          "Vidola is a multi-role service platform for Customers, Titans, and Super Admins.Customers can request services, make payments, recharge wallets, and track bookings.Titans manage their services, schedules, earnings, and bids within the app.Admins oversee users, services, requests, ratings, and reports through a web panel.",
      image: AppImage.icVidola,
      link: 'https://play.google.com/store/apps/details?id=com.vidola.gapp.customer',
    ),
    ProjectModel(
      title: "الجشعمي",
      technology: "Flutter, Java, ReactJS, MySQL",
      synopsis: "Al-Jashaami is a global brand in Iraq dealing in furniture, electrical, cosmetics and many goods. Users can browse products, explore categories, and shop seamlessly.App displays product catalog and supports multilingual shopping.",
      image: AppImage.icEcommerce,
      link: 'https://play.google.com/store/apps/details?id=com.aljcami.aljcami',
    ),
    ProjectModel(
      title: "Andiccio24",
      technology: "Flutter, WordPress, PHP, ReactJS",
      synopsis:
          "A modern food and pizza delivery app rebuilt from Ionic to Flutter.Users can browse menus, view restaurant details, and order food quickly.Google Maps support helps users track their location and estimate delivery distance.The app includes in-app webviews and essential ordering features.",
      image: AppImage.icAndiccio24,
      link: 'https://play.google.com/store/apps/details?id=com.ips.andiccio24.orders',
    ),
    ProjectModel(
      title: "USCCB Bishops Meetings",
      technology: "Flutter, NEST JS, MongoDB, ReactJS",
      synopsis:
          "A hybrid application providing users access to documents, session schedules, and chat features.Users can browse, read, and interact with content in a user-friendly interface.The admin panel manages documents, maps, events, surveys, and CMS modules.The solution enhances communication and event management for end users.",
      image: AppImage.icUsccb,
      link: 'https://play.google.com/store/apps/details?id=com.usccb',
    ),
    ProjectModel(
      title: "Super Solutions",
      technology: "NEST JS, Flutter, ReactJS,MongoDB",
      synopsis:
          "Super Solutions is a hybrid application enabling customers to book services from providers.Users can browse service categories, schedule appointments, and manage bookings.Service providers can view requests, manage payments, and handle inquiries.The platform includes a complete CMS and backend for admin-level control.",
      image: AppImage.icSupersolution,
      link: 'https://play.google.com/store/apps/details?id=com.supersolutions&hl=en',
    ),
    ProjectModel(
      title: "BHL TripHub",
      technology: "React Native, Node JS, React JS ,MongoDB",
      synopsis:
          "The platform includes a web-based system for Admin and Sub Admin, along with a mobile app for Fuel Attendants. Admins can manage users, content, and overall platform settings through their web panel. Sub Admins access the same panel with limited permissions, allowing them to create, manage, and complete trips. Fuel Attendants use the mobile app to record fueling and re-fueling logs for vehicles. The system ensures smooth operations, accurate trip tracking, and efficient fuel log management.",
      image: AppImage.icBHL,
      link: 'https://play.google.com/store/apps/details?id=com.bhl.triphub',
    ),
    ProjectModel(
      title: "BrodexTrident",
      technology: "SQLite, MySQL, Kotlin, PHP, Android",
      synopsis:
          "The BrodexTrident mobile app connects engineers with the BT Aqua System in real-time.It provides job details such as site address, instructions, assets, and notes.Engineers can upload job data, photos, signatures, and parts used directly from the field.The system eliminates paper-based workflow and allows instant processing by office staff.",
      image: AppImage.icEnvitely,
      link: 'https://play.google.com/store/apps/details?id=com.brodex&hl=en_IN',
    ),
    ProjectModel(
      title: "Glow Aesthetics",
      technology: "PHP, Swift, Kotlin, iOS, Android",
      synopsis:
          "Glow Aesthetics is a healthcare and skincare service app for a Dubai-based clinic.It showcases treatments like skincare, laser, aesthetics, surgery, and wellness services.Users can explore services, learn about treatments, and connect with specialists.The app provides a modern interface built with advanced mobile technologies.",
      image: AppImage.icEnvitely,
      link: 'https://play.google.com/store/apps/details?id=com.glowdubai&hl=en',
    ),
  ];

  Future<void> _launchEmail() async {
    final Uri emailUri = Uri(scheme: 'mailto', path: 'Joshimansi669@gmail.com');
    await launchUrl(emailUri);
  }

  Future<void> _launchPhone() async {
    final Uri phoneUri = Uri(scheme: 'tel', path: '+919723555363');
    await launchUrl(phoneUri);
  }

  Future<void> _launchLinkedIn() async {
    final Uri linkedInUri = Uri.parse('https://www.linkedin.com/in/mansi-joshi-2b167a130?utm_source=share_via&utm_content=profile&utm_medium=member_android');
    await launchUrl(linkedInUri);
  }

  Future<void> _launchLinks(String link) async {
    final Uri linkedInUri = Uri.parse(link);
    await launchUrl(linkedInUri);
  }
}
