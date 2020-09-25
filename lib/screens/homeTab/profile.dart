import 'package:flutter/material.dart';
import 'package:cortex_earth_3/widgets/settings_tile.dart';
import 'package:mdi/mdi.dart';

import '../../constants.dart';

class ProfileScreen extends StatelessWidget {
  final BoxDecoration sectionWrapper = BoxDecoration(
      color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(10)));
  final EdgeInsets sectionMetaPadding =
      const EdgeInsets.fromLTRB(14, 20, 14, 10);
  final BoxDecoration sectionMetaDecoration = BoxDecoration(
    color: Colors.transparent,
  );
  final TextStyle sectionTitleTextStyle = TextStyle(fontSize: 12);
  final EdgeInsets sectionTitlePadding =
      const EdgeInsets.fromLTRB(10, 0, 0, 10);
  final CrossAxisAlignment sectionCrossAxisAlignment = CrossAxisAlignment.start;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[100],
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              // color: Colors.amber,
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 80),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Lisa Feldman BARRETT',
                        style: kArticleTitle, textAlign: TextAlign.center),
                    SizedBox(height: 10),
                    Text(
                        'Studies the nature of emotion from the perspectives of both psychology and neuroscience using experiential, behavioral, psychophysiological and brain brain-imaging techniques.',
                        textAlign: TextAlign.center,
                        style: kPostAuthor),
                    SizedBox(height: 10),
                    FlatButton.icon(
                      icon: Icon(Mdi.share),
                      label: Text('Share CV'.toUpperCase()),
                      onPressed: () {},
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                    ),
                    Text(
                        'One-click send your CV to journalists, organizers, anyone.',
                        style: kSynapseTileSubtitle,
                        textAlign: TextAlign.center),
                    SizedBox(height: 20),
                    Text('University Distinguished \nProfessor of Psychology,',
                        textAlign: TextAlign.center, style: kPostAuthor),
                    Text('Northeastern University',
                        style: kArticleBodyTextSynapse),
                    SizedBox(height: 10),
                    Text('Director,', style: kPostAuthor),
                    Text('Interdisciplinary Affective Science Laboratory',
                        style: kArticleBodyTextSynapse,
                        textAlign: TextAlign.center),
                    SizedBox(height: 10),
                    Text('Lecturer in Psychiatry,', style: kPostAuthor),
                    Text('Harvard Medical School',
                        style: kArticleBodyTextSynapse),
                    SizedBox(height: 10),
                    Text('Reseach Neuroscientist,', style: kPostAuthor),
                    Text('Massachusetts General Hospital',
                        style: kArticleBodyTextSynapse),
                    SizedBox(height: 10),
                    // FlatButton.icon(
                    //   icon: Icon(Mdi.email),
                    //   label: Text('Correspond'.toUpperCase()),
                    //   onPressed: () {},
                    //   color: Colors.white,
                    //   // shape: BoxBorder(),
                    // ),
                  ],
                ),
              ),
            ),
            _buildSettings(),
            _buildAcademic(),
            _buildDeliverables(),
            _buildOutreach(),
            _buildEvents(),
            _buildOther(),
          ],
        ),
      ),
    );
  }

  Widget _buildSettings() {
    return Container(
      padding: sectionMetaPadding,
      decoration: sectionMetaDecoration,
      child: Column(
        crossAxisAlignment: sectionCrossAxisAlignment,
        children: [
          // Container(
          //     padding: sectionTitlePadding,
          //     child: Text('Organization', style: sectionTitleTextStyle)),
          Container(
            decoration: sectionWrapper,
            child: Column(
              children: [
                SettingsTile(leadingIcon: Mdi.accountCircle, title: 'Bio'),
                SettingsTile(
                    leadingIcon: Mdi.bullhornOutline, title: 'Socials'),
                SettingsTile(
                    leadingIcon: Mdi.accountSearch, title: 'Disclosures'),
                SettingsTile(
                    leadingIcon: Mdi.accountSettings, title: 'Settings'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAcademic() {
    return Container(
      padding: sectionMetaPadding,
      decoration: sectionMetaDecoration,
      child: Column(
        crossAxisAlignment: sectionCrossAxisAlignment,
        children: [
          Container(
              padding: sectionTitlePadding,
              child: Text('Academic', style: sectionTitleTextStyle)),
          Container(
            decoration: sectionWrapper,
            child: Column(
              children: [
                SettingsTile(
                    leadingIcon: Mdi.commentQuestionOutline,
                    title: 'Research Interests'),
                _divider(),
                SettingsTile(
                    leadingIcon: Mdi.hammerWrench, title: 'Current Projects'),
                _divider(),
                SettingsTile(leadingIcon: Mdi.school, title: 'Education'),
                _divider(),
                SettingsTile(
                    leadingIcon: Mdi.bank, title: 'Academic Employment'),
                _divider(),
                SettingsTile(
                    leadingIcon: Mdi.accountCircle, title: 'Other Positions'),
                _divider(),
                SettingsTile(leadingIcon: Mdi.medalOutline, title: 'Honors'),
                _divider(),
                SettingsTile(
                    leadingIcon: Mdi.cashMultiple,
                    title: 'External Grant Support'),
                _divider(),
                SettingsTile(
                    leadingIcon: Mdi.humanGreeting,
                    title: 'Professional Service'),
                _divider(),
                SettingsTile(
                    leadingIcon: Mdi.badgeAccountHorizontalOutline,
                    title: 'Professional Memberships'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDeliverables() {
    return Container(
      padding: sectionMetaPadding,
      decoration: sectionMetaDecoration,
      child: Column(
        crossAxisAlignment: sectionCrossAxisAlignment,
        children: [
          Container(
              padding: sectionTitlePadding,
              child: Text('Output', style: sectionTitleTextStyle)),
          Container(
            decoration: sectionWrapper,
            child: Column(
              children: [
                SettingsTile(
                    leadingIcon: Mdi.textBoxCheckOutline,
                    title: 'Peer Reviewed Publications'),
                _divider(),
                SettingsTile(leadingIcon: Mdi.book, title: 'Authored Books'),
                _divider(),
                SettingsTile(
                    leadingIcon: Mdi.bookOpenVariant, title: 'Edited Volumes'),
                _divider(),
                SettingsTile(
                    leadingIcon: Mdi.fileOutline, title: 'White Papers'),
                _divider(),
                SettingsTile(
                    leadingIcon: Mdi.accountEdit, title: 'Editorial Duties'),
                _divider(),
                SettingsTile(
                    leadingIcon: Mdi.accountGroup,
                    title: 'Conference Proceedings'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOutreach() {
    return Container(
      padding: sectionMetaPadding,
      decoration: sectionMetaDecoration,
      child: Column(
        crossAxisAlignment: sectionCrossAxisAlignment,
        children: [
          Container(
              padding: sectionTitlePadding,
              child: Text('Outreach', style: sectionTitleTextStyle)),
          Container(
            decoration: sectionWrapper,
            child: Column(
              children: [
                SettingsTile(
                    leadingIcon: Mdi.fileDocumentEditOutline, title: 'Op-Eds'),
                _divider(),
                SettingsTile(
                    leadingIcon: Mdi.fileDocumentOutline, title: 'Essays'),
                _divider(),
                SettingsTile(
                    leadingIcon: Mdi.fileDocumentOutline,
                    title: 'Popular Articles'),
                _divider(),
                SettingsTile(leadingIcon: Mdi.videoOutline, title: 'Videos'),
                _divider(),
                SettingsTile(leadingIcon: Mdi.podcast, title: 'Podcasts'),
                _divider(),
                SettingsTile(
                    leadingIcon: Mdi.fileDocumentOutline, title: 'Blog Posts'),
                _divider(),
                SettingsTile(
                    leadingIcon: Mdi.accountGroup,
                    title: 'Public Lecture & Discussions'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEvents() {
    return Container(
      padding: sectionMetaPadding,
      decoration: sectionMetaDecoration,
      child: Column(
        crossAxisAlignment: sectionCrossAxisAlignment,
        children: [
          Container(
              padding: sectionTitlePadding,
              child: Text('Events', style: sectionTitleTextStyle)),
          Container(
            decoration: sectionWrapper,
            child: Column(
              children: [
                SettingsTile(
                    leadingIcon: Mdi.accountVoice,
                    title: 'Keynote & Invited Addresses'),
                _divider(),
                SettingsTile(
                    leadingIcon: Mdi.accountMultipleCheck,
                    title: 'Conferences Organized'),
                _divider(),
                SettingsTile(leadingIcon: Mdi.teach, title: 'Workshops'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOther() {
    return Container(
      padding: sectionMetaPadding,
      decoration: sectionMetaDecoration,
      child: Column(
        crossAxisAlignment: sectionCrossAxisAlignment,
        children: [
          Container(
              padding: sectionTitlePadding,
              child: Text('Other', style: sectionTitleTextStyle)),
          Container(
            decoration: sectionWrapper,
            child: Column(
              children: [
                SettingsTile(
                    leadingIcon: Mdi.briefcaseAccount, title: 'Consulting'),
                _divider(),
                SettingsTile(
                    leadingIcon: Mdi.bankOutline,
                    title: 'Congressional Testimony'),
                _divider(),
                SettingsTile(
                    leadingIcon: Mdi.accountHardHat,
                    title: 'Community Service'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _divider() {
    return Container(height: 1, color: Colors.grey[100]);
  }
}
