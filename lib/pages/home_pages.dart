import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_app/pages/choose_topic_page.dart';
import 'package:responsive_app/utils/theme.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    final orientation =
        MediaQuery.of(context).orientation; //lấy thông số ngang dọc của device
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kColorPrimary,
      body: SafeArea(
        child: orientation == Orientation.portrait
            ? Stack(
                children: [
                  const BodyStarted(),
                  const FractionallySizedBox(
                    heightFactor: 0.35,
                    child: TextStarted(),
                  ),
                  Align(
                    alignment: const Alignment(0.0, 0.95),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('$ChooseTopicPage');
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(kColorPrimaryGray),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(38),
                          ),
                        ),
                        elevation: MaterialStateProperty.all(0),
                        fixedSize: MaterialStateProperty.all(
                          Size(
                            size.width * 0.9,
                            size.height * 0.065,
                          ),
                        ),
                        textStyle: MaterialStateProperty.all(
                          PrimaryFont.medium(size.height * 0.018),
                        ),
                        foregroundColor:
                            MaterialStateProperty.all(kColorPrimaryText),
                      ),
                      child: const Text(
                        'GET STARTED',
                      ),
                    ),
                  )
                ],
              )
            : Row(
                children: const [
                  Expanded(
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: FractionallySizedBox(
                        heightFactor: 0.8,
                        child: TextStarted(),
                      ),
                    ),
                  ),
                  Expanded(child: BodyStarted()),
                ],
              ),
      ),
    );
  }
}

class BodyStarted extends StatelessWidget {
  const BodyStarted({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Align(
      alignment: Alignment.bottomCenter,
      child: FractionallySizedBox(
        heightFactor: orientation == Orientation.portrait ? 0.6 : 0.9,
        widthFactor: 1,
        child: FittedBox(
          //sử dụng thằng này trong trường hợp này sẽ để cho thằng con nó phải ràng buộc kích thước với thằng cha bất kể điểu gì
          fit: BoxFit.cover,
          alignment: Alignment.topCenter,
          clipBehavior: Clip.antiAlias,
          child: SvgPicture.asset('assets/images/ic_picture.svg'),
        ),
      ),
    );
  }
}

class TextStarted extends StatelessWidget {
  const TextStarted({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          flex: 2,
          fit: FlexFit.tight,
          child: SvgPicture.asset(
            'assets/images/ic_logo.svg',
            alignment: const Alignment(0.0, -0.8),
          ),
        ),
        Flexible(
          flex: 1,
          fit: FlexFit.tight,
          child: FittedBox(
            child: RichText(
              textAlign: TextAlign.center,
              //sử dụng thằng này để chúng ta có thể gộp 2 thằng text lại với nhau và có thể căn xuống dòng bằng ký tự
              text: TextSpan(
                text: 'Hi Afsar, Welcome\n',
                style: PrimaryFont.medium(30).copyWith(
                  color: kColorPrimaryGray,
                  height: 1.3,
                ),
                children: [
                  TextSpan(
                    text: 'to Silent Moon',
                    style: PrimaryFont.thin(30).copyWith(
                      color: kColorPrimaryGray,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Flexible(
          flex: 1,
          fit: FlexFit.tight,
          child: SizedBox.expand(
            child: FractionallySizedBox(
              widthFactor: 0.8,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: FittedBox(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      'Explore the app, Find some peace of mind \n to prepare for meditation.',
                      style: PrimaryFont.light(16).copyWith(
                        color: kColorPrimaryYellow,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
