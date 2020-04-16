import 'package:challenge002/home/blobs/entity.dart';
import 'package:challenge002/home/blobs/index.dart';
import 'package:challenge002/home/dashboard/index.dart';
import 'package:challenge002/home/map/index.dart';
import 'package:challenge002/home/searchBar/index.dart';
import 'package:flutter/material.dart';

import 'header/index.dart';

enum Panels {
  Dashboard,
  Blobs,
  Map,
}

class ScreenHome extends StatefulWidget {
  @override
  _ScreenHomeState createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  Panels _currentPanel = Panels.Dashboard;

  bool _searchBarExpanded = false;
  bool _headerVisible = true;
  bool _blobsVisibles = false;
  int _selectedBlob;
  bool _mapBottomSheetExpanded = false;

  _onButtonSearchTap() async {
    setState(() {
      _currentPanel = Panels.Blobs;
      _searchBarExpanded = true;
      _headerVisible = false;
      _selectedBlob = null;
    });

    await Future.delayed(Duration(milliseconds: 500));
    setState(() {
      _blobsVisibles = true;
    });
  }

  _onBlobTap(BlobEntity blob) async {
    setState(() {
      _selectedBlob = blob.number;
    });

    await Future.delayed(Duration(milliseconds: 1000));
    setState(() {
      _currentPanel = Panels.Map;
    });
  }

  _onMapTap() {
    setState(() {
      _mapBottomSheetExpanded = !_mapBottomSheetExpanded;
      _searchBarExpanded = !_mapBottomSheetExpanded;
    });
  }

  Future<bool> _onBackTap() async {
    if (_currentPanel == Panels.Blobs) {
      setState(() {
        _headerVisible = true;
        _searchBarExpanded = false;
        _currentPanel = Panels.Dashboard;
        _blobsVisibles = false;
      });
      return false;
    }

    if (_currentPanel == Panels.Map) {
      if (_mapBottomSheetExpanded) {
        _onMapTap();
        return false;
      }

      setState(() {
        _currentPanel = Panels.Blobs;
        _selectedBlob = null;
      });
      return false;
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackTap,
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          child: Stack(
            children: <Widget>[
              Blobs(
                visible: _currentPanel == Panels.Blobs,
                blobsVisibles: _blobsVisibles,
                onBlobTap: _onBlobTap,
                selectedBlob: _selectedBlob,
              ),
              MapContainer(
                visible: _currentPanel == Panels.Map,
                onMapTap: _onMapTap,
                expanded: _mapBottomSheetExpanded,
              ),
              Dashboard(
                visible: _currentPanel == Panels.Dashboard,
              ),
              Header(
                visible: _headerVisible,
              ),
              SearchBar(
                visible: true,
                expanded: _searchBarExpanded,
                onSearchTap: _onButtonSearchTap,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
