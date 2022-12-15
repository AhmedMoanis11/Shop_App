import 'package:flutter/material.dart';
import 'package:shop_app/layout/login/login.dart';
import 'package:shop_app/shared/shared_pre.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class onboardingg {
  final String Images;
  final String text;
  final String body;

  onboardingg(this.Images, this.text, this.body);
}

class OnBording extends StatefulWidget {
  @override
  State<OnBording> createState() => _OnBordingState();
}

class _OnBordingState extends State<OnBording> {
  List<onboardingg> screen = [
    onboardingg('images/onboarding2.jpg', ' More Shopping More Offers', 'all you need in here'),
    onboardingg('images/onboarding3.jpg', ' The Best Offers and Deals', 'Order your dessert online'),
    onboardingg('images/onboarding4.jpg', ' Enjoy Exclusive Deals', 'millions of product available'),

  ];


  var boardcontroller=PageController();
  bool islast =true;
  bool isSkip =true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(onPressed: ()
              {
                if(isSkip)
                  {
                    CacheHelper.saveData(key: 'OnBoarding', value: true).then((value) {
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>LoginShopApp()), (route) => true);

                    });


                  }

              }, child:Text(
            'Skip',
            style: TextStyle(
              color: Colors.black,
            ),
          ), ),

        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                physics: BouncingScrollPhysics(),
                controller: boardcontroller,
                onPageChanged: (int index)
                {
                  if(index==screen.length-1)
                    {
                      setState(() {
                        islast=true;
                        print('last');
                      });
                    }
                  else
                    {
                      setState(() {
                        islast=false;
                        print('Mot last');
                      });
                    }
                },
                itemBuilder: (context, index) {
                  return buildShopApp(screen[index]);
                },
                itemCount: screen.length,
              ),
            ),
            Row(
              children: [
              SmoothPageIndicator(
                  controller: boardcontroller,
                  effect: ExpandingDotsEffect(
                    dotColor: Colors.grey,
                    spacing: 5.0,
                    activeDotColor: Colors.teal,
                    dotHeight: 15.0,
                    expansionFactor: 3.0,
                  ),
                  count: screen.length
              ),
                Spacer(),
                FloatingActionButton(
                  onPressed: () {
                    if(islast)
                      {
                        CacheHelper.saveData(key: 'OnBoarding', value: true).then((value) {
                          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>LoginShopApp()), (route) => true);

                        });

                      }
                    boardcontroller.nextPage(duration: Duration(
                      milliseconds: 600,
                    ), curve:Curves.fastLinearToSlowEaseIn, );
                  },
                  child: Icon(
                    Icons.arrow_forward,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildShopApp(onboardingg model) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            child: Image(
              fit: BoxFit.fill,
              width: 400.0,
                height: 400.0,

                image: AssetImage('${model.Images}')
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          Text(
            '${model.text}',
            style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            '${model.body}',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
