import 'package:flutter/material.dart';
import 'package:gzx_dropdown_menu/gzx_dropdown_menu.dart';
import 'package:mdi/mdi.dart';

class SortCondition {
  String name;
  bool isSelected;

  SortCondition({this.name, this.isSelected});
}

class FeedScreen2 extends StatefulWidget {
  @override
  _FeedScreen2State createState() => _FeedScreen2State();
}

class _FeedScreen2State extends State<FeedScreen2> {
  List<String> _dropDownHeaderItemStrings = [
    'Tags',
    'Type',
    'Sort By',
    'Filters'
  ];
  List<SortCondition> _typeConditions = [];
  List<SortCondition> _sortConditions = [];
  SortCondition _selectTypeCondition;
  SortCondition _selectSortCondition;
  GZXDropdownMenuController _dropdownMenuController =
      GZXDropdownMenuController();

  var _scaffoldKey = new GlobalKey<ScaffoldState>();
  GlobalKey _stackKey = GlobalKey();

  String _dropdownMenuChange = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _typeConditions.add(SortCondition(name: 'All', isSelected: true));
    _typeConditions
        .add(SortCondition(name: 'Clinical Case Study', isSelected: false));
    _typeConditions
        .add(SortCondition(name: 'Clinical Study Protocol', isSelected: false));
    _typeConditions
        .add(SortCondition(name: 'Clinical Trial', isSelected: false));
    _typeConditions.add(SortCondition(name: 'Code', isSelected: false));
    _typeConditions
        .add(SortCondition(name: 'Community Case Study', isSelected: false));
    _typeConditions.add(SortCondition(name: 'Commentary', isSelected: false));
    _typeConditions
        .add(SortCondition(name: 'Conceptual Analysis', isSelected: false));
    _typeConditions.add(SortCondition(name: 'Core Concept', isSelected: false));
    _typeConditions.add(SortCondition(name: 'Data Report', isSelected: false));
    _typeConditions.add(SortCondition(name: 'Editorial', isSelected: false));
    _typeConditions
        .add(SortCondition(name: 'Emperical Study', isSelected: false));
    _typeConditions
        .add(SortCondition(name: 'Hypothesis & Theory', isSelected: false));
    _typeConditions.add(SortCondition(name: 'Methods', isSelected: false));
    _typeConditions.add(SortCondition(name: 'Opinion', isSelected: false));
    _typeConditions
        .add(SortCondition(name: 'Original Research', isSelected: false));
    _typeConditions.add(SortCondition(name: 'Perspective', isSelected: false));
    _typeConditions.add(
        SortCondition(name: 'Policy & Practice Review', isSelected: false));
    _typeConditions.add(SortCondition(name: 'Protocols', isSelected: false));
    _typeConditions.add(SortCondition(name: 'Review', isSelected: false));
    _typeConditions
        .add(SortCondition(name: 'Review - Systematic', isSelected: false));
    _typeConditions
        .add(SortCondition(name: 'Technology Report', isSelected: false));
    _selectTypeCondition = _typeConditions[0];

    _sortConditions.add(SortCondition(name: 'Endorsed', isSelected: true));
    _sortConditions.add(SortCondition(name: 'Synapsed', isSelected: false));
    _sortConditions.add(SortCondition(name: 'New', isSelected: false));
    _sortConditions.add(SortCondition(name: 'Read', isSelected: false));
    _sortConditions.add(SortCondition(name: 'Rising', isSelected: false));
    _sortConditions.add(SortCondition(name: 'Discussed', isSelected: false));

    _selectSortCondition = _sortConditions[0];
  }

  @override
  Widget build(BuildContext context) {
    print('_GZXDropDownMenuTestPageState.build');

    return Scaffold(
      key: _scaffoldKey,
      // appBar: PreferredSize(
      //     child: AppBar(
      //       brightness: Brightness.dark,
      //       backgroundColor: Theme.of(context).primaryColor,
      //       elevation: 0,
      //     ),
      //     preferredSize: Size.fromHeight(0)),
      // backgroundColor: Colors.white,
      endDrawer: Container(
        margin: EdgeInsets.only(
            left: MediaQuery.of(context).size.width / 4, top: 0),
        color: Colors.white,
        child: _buildFilter(),
      ),
      body: Stack(
        key: _stackKey,
        children: <Widget>[
          Column(
            children: <Widget>[
              GZXDropDownHeader(
                // 下拉的头部项，目前每一项，只能自定义显示的文字、图标、图标大小修改
                items: [
                  GZXDropDownHeaderItem(_dropDownHeaderItemStrings[0]),
                  GZXDropDownHeaderItem(_dropDownHeaderItemStrings[1]),
                  GZXDropDownHeaderItem(
                    _dropDownHeaderItemStrings[2],
                    style: TextStyle(color: Colors.green),
                  ),
                  GZXDropDownHeaderItem(_dropDownHeaderItemStrings[3],
                      iconData: Mdi.filterVariant, iconSize: 18),
                ],
                // GZXDropDownHeader对应第一父级Stack的key
                stackKey: _stackKey,
                // controller用于控制menu的显示或隐藏
                controller: _dropdownMenuController,
                // 当点击头部项的事件，在这里可以进行页面跳转或openEndDrawer
                onItemTap: (index) {
                  if (index == 3) {
                    _dropdownMenuController.hide();
                    _scaffoldKey.currentState.openEndDrawer();
                  }
                },
//                // 头部的高度
//                height: 40,
//                // 头部背景颜色
//                color: Colors.red,
//                // 头部边框宽度
//                borderWidth: 1,
//                // 头部边框颜色
//                borderColor: Color(0xFFeeede6),
//                // 分割线高度
//                dividerHeight: 20,
//                // 分割线颜色
//                dividerColor: Color(0xFFeeede6),
//                // 文字样式
                style: TextStyle(color: Color(0xFF666666), fontSize: 14),
//                // 下拉时文字样式
                dropDownStyle: TextStyle(
                  fontSize: 14,
                  color: Theme.of(context).primaryColor,
                ),
//                // 图标大小
//                iconSize: 20,
//                // 图标颜色
//                iconColor: Color(0xFFafada7),
//                // 下拉时图标颜色
//                iconDropDownColor: Theme.of(context).primaryColor,
              ),
              Expanded(
                child: ListView.separated(
                    itemCount: 100,
                    separatorBuilder: (BuildContext context, int index) =>
                        Divider(height: 1.0),
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        leading: Text('Article $index'),
                        onTap: () {},
                      );
                    }),
              ),
            ],
          ),
          // 下拉菜单
          GZXDropDownMenu(
            // controller用于控制menu的显示或隐藏
            controller: _dropdownMenuController,
            // 下拉菜单显示或隐藏动画时长
            animationMilliseconds: 300,
            // 下拉后遮罩颜色
//          maskColor: Theme.of(context).primaryColor.withOpacity(0.5),
//          maskColor: Colors.red.withOpacity(0.5),
            dropdownMenuChanging: (isShow, index) {
              setState(() {
                _dropdownMenuChange = '(正在${isShow ? '显示' : '隐藏'}$index)';
                print(_dropdownMenuChange);
              });
            },
            dropdownMenuChanged: (isShow, index) {
              setState(() {
                _dropdownMenuChange = '(已经${isShow ? '显示' : '隐藏'}$index)';
                print(_dropdownMenuChange);
              });
            },
            // 下拉菜单，高度自定义，你想显示什么就显示什么，完全由你决定，你只需要在选择后调用_dropdownMenuController.hide();即可
            menus: [
              GZXDropdownMenuBuilder(
                  dropDownHeight: 40 * 8.0,
                  dropDownWidget: _buildAddressWidget((selectValue) {
                    _dropDownHeaderItemStrings[0] = selectValue;
                    _dropdownMenuController.hide();
                    setState(() {});
                  })),
              GZXDropdownMenuBuilder(
                  dropDownHeight: 40 * 8.0,
                  dropDownWidget:
                      _buildConditionListWidget(_typeConditions, (value) {
                    _selectTypeCondition = value;
                    _dropDownHeaderItemStrings[1] =
                        _selectTypeCondition.name == 'All'
                            ? 'Type'
                            : _selectTypeCondition.name;
                    _dropdownMenuController.hide();
                    setState(() {});
                  })),
              GZXDropdownMenuBuilder(
                  dropDownHeight: 40.0 * _sortConditions.length,
                  dropDownWidget:
                      _buildConditionListWidget(_sortConditions, (value) {
                    _selectSortCondition = value;
                    _dropDownHeaderItemStrings[2] = _selectSortCondition.name;
                    _dropdownMenuController.hide();
                    setState(() {});
                  })),
            ],
          ),
        ],
      ),
    );
  }

  int _selectTempFirstLevelIndex = 0;
  int _selectFirstLevelIndex = 0;
  int _selectSecondLevelIndex = -1;

  _buildAddressWidget(void itemOnTap(String selectValue)) {
//    List firstLevels = new List<int>.filled(15, 0);
    List firstLevels = new List<String>.generate(15, (int index) {
      if (index == 0) {
        return 'Favs';
      }
      return 'Tag $index ';
    });

    List secondLevels = new List<String>.generate(15, (int index) {
      if (index == 0) {
        return 'All';
      }
      return 'Sub-tag $index';
    });

    return Row(
      children: <Widget>[
        Container(
          width: 100,
          child: ListView(
            children: firstLevels.map((item) {
              int index = firstLevels.indexOf(item);
              return GestureDetector(
                onTap: () {
                  _selectTempFirstLevelIndex = index;

                  if (_selectTempFirstLevelIndex == 0) {
                    itemOnTap('Favs');
                    return;
                  }
                  setState(() {});
                },
                child: Container(
                    height: 40,
                    color: _selectTempFirstLevelIndex == index
                        ? Colors.grey[200]
                        : Colors.white,
                    alignment: Alignment.center,
                    child: _selectTempFirstLevelIndex == index
                        ? Text(
                            '$item',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                            ),
                          )
                        : Text('$item')),
              );
            }).toList(),
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.grey[200],
            child: _selectTempFirstLevelIndex == 0
                ? Container()
                : ListView(
                    children: secondLevels.map((item) {
                      int index = secondLevels.indexOf(item);
                      return GestureDetector(
                          onTap: () {
                            _selectSecondLevelIndex = index;
                            _selectFirstLevelIndex = _selectTempFirstLevelIndex;
                            if (_selectSecondLevelIndex == 0) {
                              itemOnTap(firstLevels[_selectFirstLevelIndex]);
                            } else {
                              itemOnTap(item);
                            }
                          },
                          child: Container(
                            height: 40,
                            alignment: Alignment.centerLeft,
                            child: Row(children: <Widget>[
                              SizedBox(
                                width: 20,
                              ),
                              _selectFirstLevelIndex ==
                                          _selectTempFirstLevelIndex &&
                                      _selectSecondLevelIndex == index
                                  ? Text(
                                      '$item',
                                      style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    )
                                  : Text('$item'),
                            ]),
                          ));
                    }).toList(),
                  ),
          ),
        )
      ],
    );
  }

  _buildConditionListWidget(
      items, void itemOnTap(SortCondition sortCondition)) {
    return ListView.separated(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: items.length,
      // item 的个数
      separatorBuilder: (BuildContext context, int index) =>
          Divider(height: 1.0),
      // 添加分割线
      itemBuilder: (BuildContext context, int index) {
        SortCondition goodsSortCondition = items[index];
        return GestureDetector(
          onTap: () {
            for (var value in items) {
              value.isSelected = false;
            }
            goodsSortCondition.isSelected = true;

            itemOnTap(goodsSortCondition);
          },
          child: Container(
//            color: Colors.blue,
            height: 40,
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Text(
                    goodsSortCondition.name,
                    style: TextStyle(
                      color: goodsSortCondition.isSelected
                          ? Theme.of(context).primaryColor
                          : Colors.black,
                    ),
                  ),
                ),
                goodsSortCondition.isSelected
                    ? Icon(
                        Icons.check,
                        color: Theme.of(context).primaryColor,
                        size: 16,
                      )
                    : SizedBox(),
                SizedBox(
                  width: 16,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // final List<String> _filters = ['Filter 1', 'Filter 2', 'Filter 3'];
  List<String> _selectedNephrons = [];
  List<String> _selectedAuthors = [];

  Widget _buildFilter() {
    return Container(
      // color: Colors.amber,
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: ListView(
        children: <Widget>[
          TextField(
            autofocus: true,
            decoration: InputDecoration(
                hintText: 'Search...', border: InputBorder.none),
          ),
          //TODO: TextInputController...
          Divider(),
          _buildTime(),
          Divider(),
          _buildNephron(),
          Divider(),
          _buildAuthors(),
        ],
      ),
    );
  }

  Widget _buildTime() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Text('Year Filter'),
          Row(
            children: [
              Flexible(
                  child: TextField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          hintText: '1665', border: InputBorder.none))),
              Text('  -  '),
              Flexible(
                  child: TextField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          hintText: '2020', border: InputBorder.none))),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildAuthors() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Text('Limit to Authors...'),
          Text(_selectedAuthors.toString()),
          Row(
            children: [
              FilterChip(
                  label: Text('Author 1'),
                  onSelected: (bool value) {
                    setState(() {
                      if (value) {
                        _selectedAuthors.add('Author 1');
                      } else {
                        _selectedAuthors
                            .removeWhere((element) => element == 'Author 1');
                      }
                    });
                  }),
              FilterChip(
                  label: Text('Author 2'),
                  onSelected: (bool value) {
                    setState(() {
                      if (value) {
                        _selectedAuthors.add('Author 2');
                      } else {
                        _selectedAuthors
                            .removeWhere((element) => element == 'Author 2');
                      }
                    });
                  }),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNephron() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Text('Limit to Nephrons...'),
          Text(_selectedNephrons.toString()),
          Row(
            children: [
              FilterChip(
                  label: Text('Filter 1'),
                  onSelected: (bool value) {
                    setState(() {
                      if (value) {
                        _selectedNephrons.add('Filter 1');
                      } else {
                        _selectedNephrons
                            .removeWhere((element) => element == 'Filter 1');
                      }
                    });
                  }),
              FilterChip(
                  label: Text('Filter 2'),
                  onSelected: (bool value) {
                    setState(() {
                      if (value) {
                        _selectedNephrons.add('Filter 2');
                      } else {
                        _selectedNephrons
                            .removeWhere((element) => element == 'Filter 2');
                      }
                    });
                  }),
            ],
          ),
        ],
      ),
    );
  }
}
