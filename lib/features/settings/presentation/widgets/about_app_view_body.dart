import 'package:flutter/material.dart';

import 'package:foot_stream/core/widgets/speech_handler_widget.dart';

class AboutAppViewBody extends StatefulWidget {
  const AboutAppViewBody({super.key});

  @override
  State<AboutAppViewBody> createState() => _AboutAppViewBodyState();
}

class _AboutAppViewBodyState extends State<AboutAppViewBody> {
  final String text = '''
مرحباً بك في هذا التطبيق،
تم تصميم هذا التطبيق خصيصاً لمساعدة المكفوفين وضعاف البصر على متابعة مباريات كرة القدم بطريقة سهلة وممتعة.

لا تحتاج إلى رؤية الشاشة، فكل تفاصيل المباراة سيتم شرحها لك بصوت واضح.
سوف تستمع إلى وصف الأهداف، التمريرات، التسللات، وحتى تحركات اللاعبين داخل الملعب.

عند حدوث أي حدث مهم في المباراة، ستسمع وصفاً صوتياً واضحاً، كما سيصل إلى هاتفك اهتزاز بسيط لتنبيهك بالحدث.

يوجد أيضاً صفحة خاصة تشرح شكل الملعب وتقسيماته، حتى تتمكن من تخيل مكان الكرة أو الحدث أثناء المباراة.

هدفنا أن يستمتع الجميع بتجربة رياضية شاملة وسهلة، دون أي عوائق.

نتمنى لك تجربة ممتعة.
''';
  @override
  void initState() {
    _initSpeech();
    super.initState();
  }

  Future<void> _initSpeech() async {
    await TtsService().speak(text);
  }

  @override
  void dispose() {
    TtsService().stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: ListView(
        children: [
          Text(
            "عن التطبيق ",
            textAlign: TextAlign.end,
            style: TextStyle(
              color: Colors.blue,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          Text(
            "$text",
            textAlign: TextAlign.end,
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
