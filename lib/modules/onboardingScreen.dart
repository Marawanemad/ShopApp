import 'package:flutter/material.dart';
import 'package:shopapp/widgets/boardingItemes.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// make class with constractor to take data
class boardmodel {
  String image;
  String HeadTitle;
  String BodyTitle;
  boardmodel(
      {required this.image, required this.HeadTitle, required this.BodyTitle});
}

class onboardingscreen extends StatefulWidget {
  const onboardingscreen({super.key});

  @override
  State<onboardingscreen> createState() => _onboardingscreenState();
}

class _onboardingscreenState extends State<onboardingscreen> {
  bool islast = false;
  @override
  Widget build(BuildContext context) {
    var boardingController = PageController();
    // store objects from constractors in list
    List boarding = [
      boardmodel(
          image: 'assets/images/onboardingImage.png',
          HeadTitle: "HeadTitle 1",
          BodyTitle: "BodyTitle 1"),
      boardmodel(
          image: 'assets/images/onboardingImage.png',
          HeadTitle: "HeadTitle 2",
          BodyTitle: "BodyTitle 2"),
      boardmodel(
          image: 'assets/images/onboardingImage.png',
          HeadTitle: "HeadTitle 3",
          BodyTitle: "BodyTitle 3"),
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          TextButton(
              onPressed: () => onBoardingClick(context: context),
              child: const Text(
                "Skip",
                style: TextStyle(color: Colors.pink, fontSize: 22),
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Expanded(
              flex: 4,
              // make page view to make onboarding
              child: PageView.builder(
                controller: boardingController,
                onPageChanged: (value) {
                  if (value == boarding.length - 1) {
                    setState(() {
                      islast = true;
                    });
                  } else {
                    setState(() {
                      islast = false;
                    });
                  }
                },
                itemBuilder: (context, index) =>
                    buildBoardingItem(boarding[index]),
                itemCount: boarding.length,
                // to remove shape appear in the edges when scrolling
                physics: const BouncingScrollPhysics(),
              ),
            ),
            const SizedBox(height: 30),
            Expanded(
              child: Row(
                children: [
                  // to make indicator to show the swapping
                  SmoothPageIndicator(
                    // make controller to show how the indicator will change
                    // هيتغيروا سوا page view يعني بحدد هو هيتغير لما ايه يتغير انا هنا عامله علي ال
                    controller: boardingController,
                    count: boarding.length,
                    // shape of indicator move
                    effect: const JumpingDotEffect(
                      dotColor: Colors.blueAccent,
                      activeDotColor: Colors.pink,
                      spacing: 10,
                      jumpScale: 2,
                      dotWidth: 20,
                    ),
                  ),
                  // to make any thing after go to end of screen in Row
                  const Spacer(),

                  FloatingActionButton(
                    backgroundColor: Colors.pink,
                    onPressed: () {
                      if (islast == true) {
                        onBoardingClick(context: context);
                      } else {
                        // to make button lead to next page with duration time and curve shape using the controller
                        boardingController.nextPage(
                            duration: const Duration(milliseconds: 750),
                            curve: Curves.easeInOutCubicEmphasized);
                      }
                    },
                    child: const Icon(Icons.arrow_forward_ios_rounded,
                        color: Colors.white),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
