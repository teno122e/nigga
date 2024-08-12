import 'package:flutter/material.dart';

class PrayerDetailScreen extends StatelessWidget {
  final String name;
  final String image;
  final String introText;
  final String content;

  PrayerDetailScreen({
    required this.name,
    required this.image,
    required this.introText,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30.0), // Adjust the value for more roundness
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 20),
          Text(
            introText, // Display the introductory text
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent, // Example color
            ),
          ),
          SizedBox(height: 20),
          Text(
            "مقدمة كل ساعة",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.deepOrange, // Example color
            ),
          ),
          SizedBox(height: 10), // Add some space between texts
          Text(
            "باسم الآب والابن والروح القدس الإله الواحد آمين. يا رب ارحم. يا رب ارحم. يا رب بارك. آمين. المجد للآب والابن والروح القدس الآن وكل أوان وإلى دهر الدهور آمين.",
            style: TextStyle(
              fontSize: 14,
              color: Colors.white, // Example color
            ),
          ),
          SizedBox(height: 20),
          ExpansionTile(
            initiallyExpanded: true, // Set to true to expand initially
            title: Text(
              "الصلاة الربانية",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.deepOrange),
            ),
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "اللهم اجعلنا مستحقين أن نقول بشكر: أبانا الذي في السموات. ليتقدس اسمك. ليأت ملكوتك. لتكن مشيئتك. كما في السماء كذلك على الأرض. خبزنا الذي للغد أعطنا اليوم. وأغفر لنا ذنوبنا كما نغفر نحن أيضا للمذنبين إلينا. ولا تدخلنا في تجربة. لكن نجنا من الشرير. بالمسيح يسوع ربنا لأن لك الملك والقوة والمجد إلى الأبد. آمين.",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          ExpansionTile(
            initiallyExpanded: true, // Set to true to expand initially
            title: Text(
              "صلاة الشكر",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.deepOrange),
            ),
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "فلنشكر صانع الخيرات الرحوم الله، أبا ربنا وإلهنا ومخلصنا يسوع المسيح، لأنه سترنا وأعاننا، وحفظنا، وقبلنا إليه وأشفق علينا وعضدنا، وأتى بنا إلى هذه الساعة. هو أيضا فلنسأله أن يحفظنا في هذا اليوم المقدس وكل أيام حياتنا بكل سلام. الضابط الكل الرب إلهنا. أيها السيد الإله ضابط الكل أبو ربنا وإلهنا ومخلصنا يسوع المسيح، نشكرك على كل حال ومن أجل كل حال، وفى كل حال، لأنك سترتنا، وأعنتنا، وحفظتنا، وقبلتنا إليك، وأشفقت علينا، وعضدتنا، وأتيت بنا إلى هذه الساعة. من أجل هذا نسأل ونطلب من صلاحك يا محب البشر، امنحنا أن نكمل هذا اليوم المقدس وكل أيام حياتنا بكل سلام مع خوفك. كل حسد، وكل تجربة وكل فعل الشيطان ومؤامرة الناس الأشرار، وقيام الأعداء الخفيين والظاهريين، انزعها عنا وعن سائر شعبك، وعن موضعك المقدس هذا. أما الصالحات والنافعات فارزقنا إياها. لأنك أنت الذي أعطيتنا السلطان أن ندوس الحيات والعقارب وكل قوة العدو. ولا تدخلنا في تجربة، لكن نجنا من الشرير. بالنعمة والرأفات ومحبة البشر اللواتي لابنك الوحيد ربنا وإلهنا ومخلصنا يسوع المسيح. هذا الذي من قبله المجد والإكرام والعزة والسجود تليق بك معه مع الروح القدس المحيي المساوي لك الآن وكل أوان وإلى دهر الدهور آمين..",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          ExpansionTile(
            initiallyExpanded: true, // Set to true to expand initially
            title: Text(
              "المزمور الخمسون",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.deepOrange),
            ),
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "ارحمني يا الله كعظيم رحمتك، ومثل كثرة رأفتك تمحو إثمي. اغسلني كثيرا من إثمي ومن خطيتي طهرني، لأني أنا عارف بإثمي وخطيتي أمامي في كل حين. لك وحدك أخطأت، والشر قدامك صنعت. لكي تتبرر في أقوالك. وتغلب إذا حوكمتُ. لأني هاأنذا بالإثم حبل بي، وبالخطايا ولدتني أمي. لأنك هكذا قد أحببت الحق، إذ أوضحت لي غوامض حكمتك ومستوراتها. تنضح على بزوفاك فأطهر، تغسلني فأبيض أكثر من الثلج. تسمعني سرورا وفرحا، فتبتهج عظامي المنسحقة. اصرف وجهك عن خطاياي، وامح كل آثامي. قلبا نقيا اخلق في يا الله، وروحا مستقيما جدده في أحشائي. لا تطرحني من قدام وجهك وروحك القدوس لا تنزعه منى. امنحني بهجة خلاصك، وبروح رئاسي عضدني فأعلم الأثمة طرقك والمنافقون إليك يرجعون، نجني من الدماء يا الله إله خلاصي، فيبتهج لساني بعدلك. يا رب افتح شفتي، فيخبر فمي بتسبيحك. لأنك لو آثرت الذبيحة لكنت الآن أعطي، ولكنك لا تسر بالمحرقات، فالذبيحة لله روح منسحق. القلب المنكسر والمتواضع لا يرذله الله، أنعم يا رب بمسرتك على صهيون، ولتبن أسوار أورشليم. حينئذ تسر بذبائح البر قربانا ومحرقات ويقربون على مذابحك العجول. هلليلويا..",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          ExpansionTile(
            initiallyExpanded: true, // Set to true to expand initially
            title: Text(
              'تفاصيل الصلاة',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  content,
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
