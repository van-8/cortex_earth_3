import 'package:cortex_earth_3/widgets/actionbar_garden.dart';
import 'package:flutter/material.dart';
import 'package:cortex_earth_3/constants.dart';

class DataTableScreen extends StatefulWidget {
  @override
  _DataTableScreenState createState() => _DataTableScreenState();
}

class _DataTableScreenState extends State<DataTableScreen> {
  List<DataTableSample1> _samples;
  List<DataTableSample1> _selectedSamples;
  bool sortContinent;
  bool sortSamp;
  bool sortPop;
  bool sortSNP;
  // String dataTitle;

  @override
  void initState() {
    sortContinent = false;
    sortSamp = false;
    sortPop = false;
    sortSNP = false;
    _selectedSamples = [];
    _samples = DataTableSample1.getSampleData1();
    super.initState();
  }

  onSortColumn(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      if (ascending) {
        _samples.sort((a, b) => a.continent.compareTo(b.continent));
      } else {
        _samples.sort((a, b) => b.continent.compareTo(a.continent));
      }
    }
  }

  onSortPop(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      if (ascending) {
        _samples.sort((a, b) => a.population.compareTo(b.population));
      } else {
        _samples.sort((a, b) => b.population.compareTo(a.population));
      }
    }
  }

  onSortSamples(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      if (ascending) {
        _samples.sort((a, b) => a.sampleAmount.compareTo(b.sampleAmount));
      } else {
        _samples.sort((a, b) => b.sampleAmount.compareTo(a.sampleAmount));
      }
    }
  }

  onSortSNP(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      if (ascending) {
        _samples.sort((a, b) => a.snpHet.compareTo(b.snpHet));
      } else {
        _samples.sort((a, b) => b.snpHet.compareTo(a.snpHet));
      }
    }
  }

  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                padding: const const EdgeInsets.all(10),
                child: DataTable(
                  columnSpacing: 10,
                  sortAscending: sortContinent,
                  sortColumnIndex: 0,
                  columns: [
                    DataColumn(
                        label: Text('Continent', style: kBold),
                        onSort: (columnIndex, ascending) {
                          setState(() {
                            sortContinent = !sortContinent;
                          });
                          onSortColumn(columnIndex, ascending);
                        }),
                    DataColumn(
                        label: Text('Population', style: kBold),
                        onSort: (columnIndex, ascending) {
                          setState(() {
                            sortPop = !sortPop;
                          });
                          onSortPop(columnIndex, ascending);
                        }),
                    DataColumn(
                        label: Text('# samples', style: kBold),
                        numeric: true,
                        onSort: (columnIndex, ascending) {
                          setState(() {
                            sortSamp = !sortSamp;
                          });
                          onSortSamples(columnIndex, ascending);
                        }),
                    DataColumn(
                        label: Text('SNP Het', style: kBold),
                        numeric: true,
                        onSort: (columnIndex, ascending) {
                          setState(() {
                            sortSNP = !sortSNP;
                          });
                          onSortSNP(columnIndex, ascending);
                        }),
                    DataColumn(
                        label: Text('Hap Het', style: kBold),
                        numeric: true,
                        onSort: (columnIndex, ascending) {
                          setState(() {
                            sortSNP = !sortSNP;
                          });
                          onSortSNP(columnIndex, ascending);
                        }),
                  ],
                  rows: _samples
                      .map(
                        (e) => DataRow(
                            selected: _selectedSamples.contains(e),
                            cells: [
                              DataCell(
                                Text(e.continent),
                                onTap: () {
                                  print('Selected ${e.continent}');
                                },
                              ),
                              DataCell(
                                Text(e.population),
                                onTap: () {
                                  print('Selected ${e.population}');
                                },
                              ),
                              DataCell(
                                Text(e.sampleAmount.toString()),
                                onTap: () {
                                  print('Selected ${e.sampleAmount}');
                                },
                              ),
                              DataCell(
                                Text(e.snpHet.toString()),
                                onTap: () {
                                  print('Selected ${e.snpHet}');
                                },
                              ),
                              DataCell(
                                Text(e.hapHet.toString()),
                                onTap: () {
                                  print('Selected ${e.hapHet}');
                                },
                              ),
                            ]),
                      )
                      .toList(),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Text(
                'Populations and their average SNP and haplotype hterozygosities',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
            Container(
              child: ActionBar(),
              padding: const EdgeInsets.symmetric(horizontal: 20),
            ),
          ],
        ),
      ),
    );
  }
}

class DataTableSample1 {
  String continent;
  String population;
  int sampleAmount;
  double snpHet;
  double hapHet;

  DataTableSample1({
    this.continent,
    this.population,
    this.sampleAmount,
    this.snpHet,
    this.hapHet,
  });

  static List<DataTableSample1> getSampleData1() {
    return <DataTableSample1>[
      DataTableSample1(
          continent: 'Africa',
          population: 'Dogon',
          sampleAmount: 24,
          snpHet: 28.74,
          hapHet: 89.30),
      DataTableSample1(
          continent: 'Africa',
          population: 'Bambaran',
          sampleAmount: 25,
          snpHet: 28.91,
          hapHet: 90.66),
      DataTableSample1(
          continent: 'Europe',
          population: 'Slovenian',
          sampleAmount: 26,
          snpHet: 28.05,
          hapHet: 81.97),
      DataTableSample1(
          continent: 'East Asia',
          population: 'Buryat',
          sampleAmount: 25,
          snpHet: 26.54,
          hapHet: 79.72),
      DataTableSample1(
          continent: 'Polynesia',
          population: 'Somoan',
          sampleAmount: 13,
          snpHet: 24.65,
          hapHet: 75.30),
      DataTableSample1(
          continent: 'America',
          population: 'Bolivian',
          sampleAmount: 23,
          snpHet: 24.31,
          hapHet: 73.91),
    ];
  }
}
