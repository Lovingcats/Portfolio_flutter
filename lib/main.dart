import 'package:flutter/material.dart';
import 'package:flutterportfolio/widget/deviceframepainter.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'dart:ui' as ui;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:typed_data';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Choyongje portfolio website~!',
      debugShowCheckedModeBanner: false,
      home: ScreenTypeLayout.builder(
        breakpoints: const ScreenBreakpoints(desktop: 1024, tablet: 768, watch: 250),
        mobile: (_) => OrientationLayoutBuilder(
          portrait: (context) => const MobilePortraitScreen(),
          landscape: (context) => const MobileLandscapeScreen(),
        ),
        tablet: (_) => const TabletScreen(),
        desktop: (_) => const DesktopScreen(),
      ),
    );
  }
}

class MobilePortraitScreen extends StatelessWidget {
  const MobilePortraitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class MobileLandscapeScreen extends StatelessWidget {
  const MobileLandscapeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class TabletScreen extends StatelessWidget {
  const TabletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class DesktopScreen extends StatefulWidget {
  const DesktopScreen({super.key});

  @override
  _DesktopScreenState createState() => _DesktopScreenState();
}

class _DesktopScreenState extends State<DesktopScreen> with TickerProviderStateMixin {
  ui.Image? _backgroundImage;
  ui.Image? _pcImage;
  ui.Image? _homeButtonImage;
  ui.Image? _backButtonImage;
  ui.Image? _recentButtonImage;
  late AnimationController _animationController;
  late AnimationController _paddingController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  ValueNotifier<bool> isDialOpen = ValueNotifier(false);
  bool _isSliderVisible = false;
  bool _isdeviceVisible = false;
  bool _isbackgroundImageChangeVisible = false;
  bool _isbackgroundImageChangeVisibleCheck = false;
  double _opacity = 0.7;

  @override
  void initState() {
    _loadImage();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _paddingController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    
    _fadeAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(begin: 0.0, end: 0.2).chain(CurveTween(curve: const Interval(0.0, 0.2, curve: Curves.easeIn))),
        weight: 20,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 0.2, end: 1.0).chain(CurveTween(curve: const Interval(0.3, 1.0, curve: Curves.easeOut))),
        weight: 80,
      ),
    ]).animate(_animationController);

    _slideAnimation = Tween<Offset>(
      begin: const Offset(1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _paddingController,
      curve: Curves.easeOutCubic,
    ));

    _animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _paddingController.dispose();
    super.dispose();
  }

  Future<void> _launchUrl(String myUrl) async {
    final Uri url = Uri.parse(myUrl);
    if (await canLaunchUrl(url)) {
      try {
        final bool launched = await launchUrl(url, mode: LaunchMode.externalApplication);
        if (!launched) {}
      } catch (e) {
        print('Exception occurred while launching URL: $e');
      }
    } else {
      print('Cannot launch URL: $url');
    }
  }

  Future<void> _loadImage() async {
    final ByteData data1 = await rootBundle.load('assets/img/deviceBackground.png');
    final List<int> bytes1 = data1.buffer.asUint8List();
    final ui.Codec codec1 = await ui.instantiateImageCodec(Uint8List.fromList(bytes1));
    final ui.FrameInfo fi1 = await codec1.getNextFrame();
    
    
    final ByteData data2 = await rootBundle.load('assets/img/catBackground.jpg');
    //final ByteData data2 = await rootBundle.load('assets/img/PC_08.jpg');
    final List<int> bytes2 = data2.buffer.asUint8List();
    final ui.Codec codec2 = await ui.instantiateImageCodec(Uint8List.fromList(bytes2));
    final ui.FrameInfo fi2 = await codec2.getNextFrame();

    final ByteData homeData = await rootBundle.load('assets/img/home.png');
    final List<int> homeBytes = homeData.buffer.asUint8List();
    final ui.Codec homeCodec = await ui.instantiateImageCodec(Uint8List.fromList(homeBytes));
    final ui.FrameInfo homeFi = await homeCodec.getNextFrame();

    final ByteData backData = await rootBundle.load('assets/img/back.png');
    final List<int> backBytes = backData.buffer.asUint8List();
    final ui.Codec backCodec = await ui.instantiateImageCodec(Uint8List.fromList(backBytes));
    final ui.FrameInfo backFi = await backCodec.getNextFrame();

    final ByteData recentData = await rootBundle.load('assets/img/recent.png');
    final List<int> recentBytes = recentData.buffer.asUint8List();
    final ui.Codec recentCodec = await ui.instantiateImageCodec(Uint8List.fromList(recentBytes));
    final ui.FrameInfo recentFi = await recentCodec.getNextFrame();

    setState(() {
      _backgroundImage = fi1.image;
      _pcImage = fi2.image;
      _homeButtonImage = homeFi.image;
      _backButtonImage = backFi.image;
      _recentButtonImage = recentFi.image;
    });
  }

  void _toggleBackgroundImageChangeVisible() {
    setState(() {
      _isbackgroundImageChangeVisible = !_isbackgroundImageChangeVisible;
      if (_isbackgroundImageChangeVisible) {
        _paddingController.forward();
      } else {
        _paddingController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_backgroundImage == null || _pcImage == null || _homeButtonImage == null || _backButtonImage == null || _recentButtonImage == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      floatingActionButton: _isSliderVisible
          ? null
          : _isbackgroundImageChangeVisibleCheck ? null : Padding(
              padding: const EdgeInsets.only(right: 20, bottom: 30),
              child: SpeedDial(
                icon: Icons.settings,
                backgroundColor: const Color.fromARGB(255, 183, 228, 252),
                activeIcon: Icons.close,
                foregroundColor: Colors.black,
                iconTheme: const IconThemeData(size: 35.0),
                spacing: 3,
                openCloseDial: isDialOpen,
                childPadding: const EdgeInsets.all(0),
                spaceBetweenChildren: 15,
                buttonSize: const Size(50.0, 50.0),
                childrenButtonSize: const Size(50.0, 50.0),
                direction: SpeedDialDirection.up,
                switchLabelPosition: false,
                renderOverlay: true,
                overlayColor: Colors.black,
                overlayOpacity: 0.8,
                useRotationAnimation: true,
                tooltip: '설정',
                elevation: 8.0,
                animationCurve: Curves.elasticInOut,
                isOpenOnStart: false,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                children: [
                  SpeedDialChild(
                    child: const FaIcon(FontAwesomeIcons.rotate),
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    elevation: 0.0,
                    label: '배경 교체',
                    labelStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    onTap: (){
                      setState(() {
                        _isbackgroundImageChangeVisible = true;
                        _isbackgroundImageChangeVisibleCheck = true;
                        _paddingController.forward();
                      });
                    },
                  ),
                  SpeedDialChild(
                    child: const Icon(Icons.brightness_6),
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    elevation: 0.0,
                    label: '배경 밝기 조절',
                    labelStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    onTap: () {
                      setState(() {
                        _isSliderVisible = true;
                      });
                    },
                  ),
                  _isdeviceVisible ? SpeedDialChild(
                    child: const Icon(Icons.smartphone),
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    elevation: 0.0,
                    label: '디바이스 보기',
                    labelStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    onTap: (){
                      setState(() {
                        _isdeviceVisible = false;
                      });
                    }
                  ) : SpeedDialChild(
                    child: const Icon(Icons.panorama),
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    elevation: 0.0,
                    label: '배경만 보기',
                    labelStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    onTap: (){
                      setState(() {
                        _isdeviceVisible = true;
                      });
                    }
                  ),
                ],
              ),
            ),
      body: Stack(
        children: [
          RawImage(
            image: _pcImage!,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),

          AnimatedOpacity(
              opacity: _isbackgroundImageChangeVisibleCheck ? 0.0 : _opacity,
              duration: const Duration(milliseconds: 500),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.black,
              ),
            ),
            
          if (_isbackgroundImageChangeVisible)
            Positioned(
              right: 0,
              top: 0,
              bottom: 0,
              child: SlideTransition(
                position: _slideAnimation,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.21,
                  color: Colors.blue,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: (){
                          setState(() {
                            _isbackgroundImageChangeVisibleCheck = false;
                          });
                          _paddingController.reverse().then((_) {
                            setState(() {
                              _isbackgroundImageChangeVisible = !_isbackgroundImageChangeVisible;
                            });
                          });
                        },
                        child: const Text("닫기"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          if (!_isdeviceVisible)
            _isbackgroundImageChangeVisibleCheck ? Container() :
            Center(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final aspectRatio = 400 / 850;
                  double deviceWidth;
                  double deviceHeight;

                  if (constraints.maxWidth / constraints.maxHeight > aspectRatio) {
                    deviceHeight = constraints.maxHeight * 0.9;
                    deviceWidth = deviceHeight * aspectRatio;
                  } else {
                    deviceWidth = constraints.maxWidth * 0.9;
                    deviceHeight = deviceWidth / aspectRatio;
                  }

                  final customPainterButtonWidth = deviceWidth * 0.075;
                  final customPainterbuttonHeight = deviceHeight * 0.0325;

                  final inkwellButtonWidth = deviceWidth * 0.28;
                  final inkwellbuttonHeight = deviceHeight * 0.05;

                  final buttonSpacing = deviceWidth * 0.3;

                  return Stack(
                    children: [
                      FadeTransition(
                        opacity: _fadeAnimation,
                        child: CustomPaint(
                          size: Size(deviceWidth, deviceHeight),
                          painter: DeviceFramePainter(
                            _backgroundImage!,
                            _homeButtonImage!,
                            _backButtonImage!,
                            _recentButtonImage!,
                            customPainterButtonWidth,
                            customPainterbuttonHeight,
                            buttonSpacing,
                          ),
                        ),
                      ),
                      Positioned(
                        left: deviceWidth / 2 - buttonSpacing - inkwellButtonWidth / 2,
                        top: deviceHeight - 60 / 2 - inkwellbuttonHeight / 2 - 3,
                        child: FadeTransition(
                          opacity: _fadeAnimation,
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                print('뒤로가기 버튼');
                              },
                              borderRadius: BorderRadius.circular(inkwellButtonWidth),
                              child: Ink(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(inkwellButtonWidth),
                                  color: Colors.transparent,
                                ),
                                height: inkwellbuttonHeight,
                                width: inkwellButtonWidth,
                                child: const Center(
                                  child: Text(
                                    "",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: deviceWidth / 2 - inkwellButtonWidth / 2,
                        top: deviceHeight - 60 / 2 - inkwellbuttonHeight / 2 - 3,
                        child: FadeTransition(
                          opacity: _fadeAnimation,
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                print('홈 버튼');
                              },
                              borderRadius: BorderRadius.circular(inkwellButtonWidth),
                              child: Ink(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(inkwellButtonWidth),
                                  color: Colors.transparent,
                                ),
                                height: inkwellbuttonHeight,
                                width: inkwellButtonWidth,
                                child: const Center(
                                  child: Text(
                                    "",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: deviceWidth / 2 + buttonSpacing - inkwellButtonWidth / 2,
                        top: deviceHeight - 60 / 2 - inkwellbuttonHeight / 2 - 3,
                        child: FadeTransition(
                          opacity: _fadeAnimation,
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                print('최근앱 버튼');
                              },
                              borderRadius: BorderRadius.circular(inkwellButtonWidth),
                              child: Ink(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(inkwellButtonWidth),
                                  color: Colors.transparent,
                                ),
                                height: inkwellbuttonHeight,
                                width: inkwellButtonWidth,
                                child: const Center(
                                  child: Text(
                                    "",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: deviceWidth * 0.075,
                        top: deviceHeight * 0.825,
                        child: FadeTransition(
                          opacity: _fadeAnimation,
                          child: Container(
                            width: deviceWidth * 0.85,
                            height: deviceHeight * 0.07,
                            color: Colors.transparent,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: InkWell(
                                    onTap: () async {
                                      try {
                                        await _launchUrl("https://github.com/Lovingcats");
                                      } catch (e) {
                                        print('Error launching URL: $e');
                                      }
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.asset(
                                        'assets/img/github.png',
                                        width: deviceHeight * 0.07,
                                        height: deviceHeight * 0.07,
                                        fit: BoxFit.cover,
                                        filterQuality: FilterQuality.high,
                                      ),
                                    ),
                                  ),
                                ),
                                MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: InkWell(
                                    onTap: () async {
                                      try {
                                        await _launchUrl("https://lovely-cornucopia-0ba.notion.site/05f0c597d9ac487a9228f3fd172c196a?pvs=4");
                                      } catch (e) {
                                        print('Error launching URL: $e');
                                      }
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.asset(
                                        'assets/img/gmail.png',
                                        width: deviceHeight * 0.07,
                                        height: deviceHeight * 0.07,
                                        fit: BoxFit.cover,
                                        filterQuality: FilterQuality.high,
                                      ),
                                    ),
                                  ),
                                ),
                                MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: InkWell(
                                    onTap: () async {
                                      try {
                                        await _launchUrl("https://lovingcats.tistory.com/");
                                      } catch (e) {
                                        print('Error launching URL: $e');
                                      }
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.asset(
                                        'assets/img/tistory.png',
                                        width: deviceHeight * 0.07,
                                        height: deviceHeight * 0.07,
                                        fit: BoxFit.cover,
                                        filterQuality: FilterQuality.high,
                                      ),
                                    ),
                                  ),
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.asset(
                                    'assets/img/seeAllApp.png',
                                    width: deviceHeight * 0.07,
                                    height: deviceHeight * 0.07,
                                    fit: BoxFit.cover,
                                    filterQuality: FilterQuality.high,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      
                    ],
                  );
                },
              ),
            ),
          if (_isSliderVisible)
            Positioned(
              bottom: 50,
              right: 20,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Row(
                    children: [
                      SizedBox(
                        width: 300,
                        child: Slider(
                          value: _opacity,
                          thumbColor: const Color.fromARGB(255, 183, 228, 252),
                          activeColor: const Color.fromARGB(255, 183, 228, 252),
                          min: 0.0,
                          max: 1.0,
                          onChanged: (value) {
                            setState(() {
                              _opacity = value;
                            });
                          },
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _isSliderVisible = false;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          minimumSize: const Size(86, 42),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          )
                        ),
                        child: const Text('적용', style: TextStyle(
                          color: Colors.black
                        ),),

                      ),
                    ],
                  );
                } 
              ),
            )      
        ],
      ),
    );
  }
}
