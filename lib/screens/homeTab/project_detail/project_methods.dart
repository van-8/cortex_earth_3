import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:mdi/mdi.dart';

class ProjectMethods extends StatefulWidget {
  @override
  _ProjectMethodsState createState() => _ProjectMethodsState();
}

//TODO: Parse text? Have a Fovea view instead? Add autoRead and auto-dictate?
class _ProjectMethodsState extends State<ProjectMethods> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      // decoration: const BoxDecoration(
      //   gradient: LinearGradient(
      //     begin: Alignment.topCenter,
      //     end: Alignment.bottomLeft,
      //     colors: [
      //       Color(0xFFDB84B1),
      //       Color(0xFF3A3E88),
      //     ],
      //   ),
      // ),
      child: SafeArea(
          child: ListView(
        children: [
          Text('Feature to AutoRead next step?'),
          Text('Feature to Dictate lab notes by voice?'),
          _ContainerHeader(),
          _buildMaterialsRequired(),
          TimelineTile(
            alignment: TimelineAlign.manual,
            lineXY: 0.3,
            isFirst: true,
            indicatorStyle: IndicatorStyle(
              width: 50,
              height: 50,
              indicator: const _IconIndicator(
                iconData: Mdi.beaker,
                size: 20,
              ),
            ),
            // beforeLineStyle: LineStyle(color: Colors.white.withOpacity(0.7)),
            endChild: Text('  SETUP FOR DISSECTION'),
          ),
          _buildTimelineTile(
            indicator: const _IconIndicator(
              iconData: Mdi.weatherCloudy,
              size: 20,
            ),
            hour: 'DAY 1',
            weather:
                'Add poly D-lysine/laminin solution to culture dishes/coverslips. \nSwirl the plate to ensure that the coating mix covers the entire bottom of the plate. \nLeave the dishes/coverslips in the 37oC/5% CO2 incubator overnight.',
            // temperature: '26°C',
            // phrase: 'A beautiful afternoon to take a walk into the park.'
            //     " Don't forget to take your water.",
          ),
          _buildTimelineTile(
            indicator: const _IconIndicator(
              iconData: Mdi.weatherSunset,
              size: 20,
            ),
            hour: 'DAY 2',
            weather:
                '1. Wash the dishes/coverslips twice with sterile water; remove the final wash and leave them liquid-free in the incubator.\n2. Make up DM/KY, sterile filter and place on ice.\n3. Make up the trypsin inhibitor solution and the papain solution BUT DO NOT add papain at this point; place solutions on ice.\n4. Pour ice-cold DM/KY solution into several culture dishes: 1 large dish for the pups and 10cm dishes for the pup heads, for the intact brains and for the dissected cortices. Place dishes on ice.\n 5. Obtain pregnant rat',
            // temperature: '24°C',
            // phrase: 'Enjoy the view, the sun will be back tomorrow.',
          ),
          _buildTimelineTile(
            indicator: const _IconIndicator(
              iconData: Mdi.weatherPartlyRainy,
              size: 20,
            ),
            hour: 'DISSECTION',
            weather:
                '1. Sacrifice the rat by placing a plastic dish containing dry ice in the cage and then pouring water into this plastic dish; cover the top of the cage with a bag.\n2. After the rat fails to move spontaneously or in response to pain (touch the eye and look for a reflex), incise along the abodmen and remove the uterus. Place the pups into the large culture dish.\n3. Remove the heads of the pups and place in a 10cm dish.\n4. For each head, remove the skin and cut along the scalp in the midline with fine scissors. Make a similar midline cut in the calvarium. Deflect the calvarium with a blunt spatula and scoop the brain into another 10cm dish containing ice-cold DM/KY.\n5. Dissect the coritces: place the brain ventral side up. Place the spatula in the medial aspect of the ventral cortex and midbrain and cut the cortices off. Discard the midbrain.\n6. Dissect the hippocampus and cortex: place a cortex medial side up and place the spatula into the lateral ventricle pushing forward through the lateral aspect of the frontal cortex. Extend the cut through the cortex inferiorly and superiorly to isolate the posterior half of cortex and hippocampus. Discard the remainder.\n7. Dissect the hippocampus from the cortex: place the spatula in the lateral ventricle underneath the hippocampus. Make cuts superiorly and inferiorly to free the respective ends of the hippocampus. Roll out the hippocampus with the spatula and cut the hippocampus from the cortex near the dendate entorrhinal cortex junction. Place the individual cortices or hippocampi in 10cm dish containing ice-cold DM KY.\n8. Add the papain to the enzyme solution before stripping the meninges (or 30min before anticipated completion of dissection) and place the papain and trypsin inhibitor solutions in a 37oC water bath.\n9. Strip the meninges and cut the tissue into small 1mm3 pieces.\n 10. Sterile filter the papain and trypsin inhibitor solutions.\n 11. Transfer all of the cortical/hippocampal tissue to a 15ml conical tube. Use one 15ml tube per 5 cortices dissected. Once the tissue has settled remove the extra DM/KY solution.',
            // temperature: '18°C',
            // phrase: 'Temperature is decreasing...',
          ),
          _buildTimelineTile(
            indicator: const _IconIndicator(
              iconData: Mdi.snowflake,
              size: 20,
            ),
            hour: '00:00',
            weather: 'Chilly',
            isLast: true,
          ),
        ],
      )),
    );
  }

  TimelineTile _buildTimelineTile({
    _IconIndicator indicator,
    String hour,
    String weather,
    // String temperature,
    // String phrase,
    bool isLast = false,
  }) {
    return TimelineTile(
      alignment: TimelineAlign.manual,
      lineXY: 0.3,
      // beforeLineStyle: LineStyle(color: Colors.white.withOpacity(0.7)),
      indicatorStyle: IndicatorStyle(
        indicatorXY: 0.3,
        drawGap: true,
        width: 30,
        height: 30,
        indicator: indicator,
      ),
      isLast: isLast,
      startChild: Center(
        child: Container(
          alignment: const Alignment(0.0, -0.50),
          child: Text(
            hour,
          ),
        ),
      ),
      endChild: Padding(
        padding:
            const EdgeInsets.only(left: 16, right: 10, top: 10, bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              weather,
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildMaterialsRequired() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'MATERIALS:',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text('Poly D-lysine/laminin solution'),
        Text('DM/KY'),
        Text('Optimem'),
        Text('Neuronal growth medium'),
      ],
    ),
  );
}

class _IconIndicator extends StatelessWidget {
  const _IconIndicator({
    Key key,
    this.iconData,
    this.size,
  }) : super(key: key);

  final IconData iconData;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey[200].withOpacity(0.7),
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.center,
            child: SizedBox(
              height: 30,
              width: 30,
              child: Icon(
                iconData,
                size: size,
                color: const Color(0xFF9E3773).withOpacity(0.7),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _ContainerHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 120),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Protocol for the Primary Culture of Cortical and Hippocampal neurons',
            ),
            Text(
              'Steven Finkbeiner, UCSF',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }
}

// class _Sun extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(
//         boxShadow: [
//           BoxShadow(
//             color: Colors.white,
//             blurRadius: 25,
//             spreadRadius: 20,
//           ),
//         ],
//         shape: BoxShape.circle,
//         color: Colors.white,
//       ),
//     );
//   }
// }
