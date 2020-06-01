import 'package:auto_size_text/auto_size_text.dart';
import 'package:codexp_inapporpriate_name/ui/job_detail_page/job_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class JobListPage extends StatefulWidget {
  const JobListPage({Key key}) : super(key: key);

  @override
  _JobListPageState createState() => _JobListPageState();
}

class _JobListPageState extends State<JobListPage> {
  TextEditingController _searchQueryController = TextEditingController();
  bool _isSearching = false;
  String searchQuery = "Search query";

  @override
  Widget build(BuildContext context) {
    void updateSearchQuery(String newQuery) {
      setState(() {
        searchQuery = newQuery;
      });
    }

    Widget _buildSearchField() {
      return TextField(
        controller: _searchQueryController,
        autofocus: true,
        decoration: InputDecoration(
          hintText: "Search Data...",
          border: InputBorder.none,
          hintStyle: TextStyle(color: Colors.white30),
        ),
        style: TextStyle(color: Colors.white, fontSize: 16.0),
        onChanged: (query) => updateSearchQuery,
      );
    }

    void _clearSearchQuery() {
      setState(() {
        _searchQueryController.clear();
        updateSearchQuery("");
      });
    }

    List<Widget> _buildActions() {
      if (_isSearching) {
        return <Widget>[
          IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () {
              if (_searchQueryController == null ||
                  _searchQueryController.text.isEmpty) {
                Navigator.pop(context);
                return;
              }
              _clearSearchQuery();
            },
          ),
        ];
      }

      void _stopSearching() {
        _clearSearchQuery();

        setState(() {
          _isSearching = false;
        });
      }

      void _startSearch() {
        ModalRoute.of(context)
            .addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));

        setState(() {
          _isSearching = true;
        });
      }

      return <Widget>[
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: _startSearch,
        ),
      ];
    }

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: _isSearching ? const BackButton() : Container(),
          title: _isSearching ? _buildSearchField() : Text("Job Listings"),
          actions: _buildActions(),
        ),
        body: AnimationLimiter(
          child: Container(
            child: ListView.builder(
              itemCount: 2,
              itemBuilder: (BuildContext ctxt, int index) {
                return AnimationConfiguration.staggeredList(
                    duration: const Duration(milliseconds: 500),
                    position: index,
                    child: SlideAnimation(
                      verticalOffset: 120.0,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => JobDetailPage()));
                        },
                        child: JobCard(),
                      ),
                    ));
              },
            ),
          ),
        ));
  }
}

class JobCard extends StatelessWidget {
  const JobCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        children: [
          Row(
            children: [
              FlutterLogo(),
              SizedBox(
                width: 50,
              ),
              AutoSizeText(
                "Flutter Engineer",
                style: TextStyle(fontSize: 23),
                maxLines: 1,
              )
            ],
          ),
          Container(
            height: 30,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                SkillCard(text: "Html"),
                SkillCard(text: "CSS"),
                SkillCard(text: "JavaScript"),
                SkillCard(text: "TypeScript"),
              ],
            ),
          ),
          Divider(),
          Text(
            "Singapore",
            style: TextStyle(fontSize: 18),
          )
        ],
      ),
    );
  }
}

class SkillCard extends StatelessWidget {
  final text;
  const SkillCard({
    Key key,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Container(
        padding: EdgeInsets.only(left: 8, right: 8),
        child: Text(this.text),
      ),
    );
  }
}
