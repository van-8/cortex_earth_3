import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants.dart';

class ContributorsList extends StatefulWidget {
  @override
  _ContributorsListState createState() => _ContributorsListState();
}

class _ContributorsListState extends State<ContributorsList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.amber,
      child: Expanded(
        child: ListView(
          children: [
            ContributorListTile(
                credit: 'Conceptualization', names: 'Lisa Feldman BARRETT'),
            ContributorListTile(
                credit: 'Project Administration',
                names: '杨岗 Van YANG, Þór sonur Óðins, 文文'),
            ContributorListTile(credit: 'Funding Acquisition', names: '曹熙, 楊崗'),
            ContributorListTile(credit: 'Methodology', names: 'شاكيرا'),
            ContributorListTile(
                credit: 'Investigation', names: '広瀬 すず, Vânia Teófilo'),
            ContributorListTile(
                credit: 'Data Curation', names: 'อ่อม, प्रियंका चोपड़ा जोनास'),
            ContributorListTile(
                credit: 'Visualization',
                names:
                    'Salvador Felipe Jacinto DALÍ y DOMENECH, Фёдор Михайлович Достоевский, Aliaune Damala Bouga Time Bongo Puru Nacka Lu Lu Lu Badara Akon Thiam'),
            ContributorListTile(
                credit: 'Formal Analysis',
                names: 'Maria Skłodowska-Curie, Irène Joliot-Curie'),
            ContributorListTile(
                credit: 'Writing Draft',
                names: 'সুমিতা সান্যাল়, ᜏᜒᜃᜅ᜔ ᜆᜄᜎᜓᜄ᜔'),
            ContributorListTile(credit: 'Editing', names: 'Σωκρᾰ́της'),
            ContributorListTile(credit: 'Supervision', names: 'ഇന്ദുലാല'),
            ContributorListTile(credit: 'Review', names: '전소연'),
            ContributorListTile(credit: 'Validation', names: 'دانیال نورانی'),
            ContributorListTile(credit: 'Resources', names: 'Umnyama omnyama'),
            ContributorListTile(credit: 'Software', names: 'Þór sonur Óðins'),
          ],
        ),
      ),
    );
  }
}

class ContributorListTile extends StatelessWidget {
  final String credit;
  final String names;

  const ContributorListTile({Key key, this.credit, this.names})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4),
      // color: Colors.blue,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              width: Get.width * 0.35,
              // color: Colors.grey,
              child: Expanded(
                child: Text(
                  credit,
                  style: kProjectCREDIT,
                  textAlign: TextAlign.end,
                ),
                // flex: 2,
              )),
          SizedBox(width: 10),
          Container(
            width: Get.width * 0.4,
            // color: Colors.amber,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: names
                  .split(', ')
                  .map((String text) => Text(text, style: kProjectContributors))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
