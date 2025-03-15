import 'package:flutter/material.dart';
import 'package:foot_stream/core/widgets/speech_handler_widget.dart';

class StadiumGuideViewBody extends StatefulWidget {
  const StadiumGuideViewBody({super.key});

  @override
  State<StadiumGuideViewBody> createState() => _StadiumGuideViewBodyState();
}

class _StadiumGuideViewBodyState extends State<StadiumGuideViewBody> {
  final audioGuideText = '''
  أهلاً بك في دليل شرح الملعب الصوتي.
رح نبدأ الآن بالتعريف الكامل لتقسيمات ملعب كرة القدم، عشان تكون عندك صورة واضحة وتقدر تتابع أحداث المباراة بكل تركيز.”

“نبدأ من منطقة المرمى، وهي أقرب نقطة لحارس الفريق، وأي كرة تعبر هذا الخط بالكامل تُحسب هدف.
أمامها مباشرة تقع منطقة الجزاء، وهي المنطقة اللي يُنفذ فيها ركلات الجزاء وتحدث فيها أغلب التحديات الدفاعية.”

“بعد كذا، نجي إلى خط الدفاع، هنا يتواجد لاعبو الدفاع لحماية المرمى وصد الهجمات.”

“ثم ننتقل إلى وسط الملعب، اللي يعتبر قلب اللعب ومركز التمريرات وتنظيم الهجمات.
تحديداً في المنتصف، توجد دائرة المنتصف، وهي المكان اللي تبدأ منه المباراة وتُستأنف بعد كل هدف.”

“ننتقل الآن إلى منطقة الهجوم.
على الجهة اليمنى من الملعب، يتواجد الجناح الأيمن والظهير الأيمن، وهم المسؤولين عن الهجمات من هذا الطرف.
وفي الجهة اليسرى، يتواجد الجناح الأيسر والظهير الأيسر، اللي يسهمون بصناعة الفرص من الطرف المقابل.”

“ثم نصل إلى منطقة جزاء الخصم، وهي المنطقة اللي يسعى الفريق للوصول لها من أجل تسجيل الأهداف.
وأخيرًا، عند منطقة مرمى الخصم، تُختتم الهجمة، وأي تسديدة تصل هذه المنطقة وتدخل الشباك تُحسب هدف.”

“أيضاً عندنا خط التماس على جانبي الملعب، اللي تُنفذ منه الرميات الجانبية لما تخرج الكرة من الجنب.
وفي زوايا الملعب الأربع، توجد الركنيات، اللي تُلعب منها الكرات الثابتة بعد خروج الكرة من الطرف النهائي.”

“وبكذا تكون عرفت كل مناطق الملعب، علشان تقدر تتابع التعليق الصوتي وأنت فاهم تماماً وين تصير الهجمة أو الحدث.
''';

  late bool isPlaying;
  @override
  void initState() {
    super.initState();
    _initTts();
    isPlaying = true;
  }

  Future<void> _initTts() async {
    await TtsService().speak(audioGuideText);
  }

  @override
  void dispose() async {
    super.dispose();
    await TtsService().stop();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.sizeOf(context).width;
    final double screenHeight = MediaQuery.sizeOf(context).height;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "شرح الملعب",
            style: TextStyle(fontSize: 23, fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: screenHeight * 0.05),
          Image.asset(
            "assets/images/IMG_6181 (1).png",
            fit: BoxFit.fill,
            width: screenWidth * .60,
            height: screenHeight * 0.45,
          ),
        ],
      ),
    );
  }
}
