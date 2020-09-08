import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news360/article_view.dart';
import 'package:news360/helper/news.dart';
import 'package:news360/model/article_model.dart';

class CategoryNews extends StatefulWidget {
  final String category;
  CategoryNews({this.category});

  @override
  _CategoryNewState createState() => _CategoryNewState();
}

class _CategoryNewState extends State<CategoryNews> {
  List<ArticleModel> articles = new List<ArticleModel>();
  bool _loading = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCategoryNews();
  }
  getCategoryNews() async{
    CategoryNewsClass newsCategoryClass= CategoryNewsClass();
    await newsCategoryClass.getNews(widget.category);
    articles = newsCategoryClass.news;
    setState(() {
      _loading = false;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('News'),
            Text('360',
              style: TextStyle(
                  color: Colors.blue
              ),)
          ],
        ),
        actions: <Widget>[
          Opacity(
            opacity: 0,
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Icon(
                    Icons.add)),
          )
        ],
        centerTitle: true,
        elevation: 0.0,
      ),
      body: _loading ? Center(
        child: Container(
          child: CircularProgressIndicator()
        ),
      ) : SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 16),
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount: articles.length,
                    itemBuilder: (context, index){
                      return BlogTile(
                        imageURL: articles[index].urlToImage,
                        title: articles[index].title,
                        description: articles[index].description,
                        url: articles[index].url,
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
class BlogTile extends StatelessWidget {
  final String imageURL, title, description,url;
  BlogTile({@required this.imageURL,@required this.title,@required this.description, @required this.url});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context)=> ArticleView(
              blogURL: url,
            )
        ));
      },
      child: Container(
        margin: EdgeInsets.only(bottom:10 ),
        child: Column(
          children: <Widget>[
            ClipRRect(child: Image.network(imageURL),
              borderRadius: BorderRadius.circular(15),),
            SizedBox(height: 5,),
            Text(title, style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold
            ),),
            SizedBox(height: 8,),
            Text(description,style: TextStyle(color: Colors.black45),)
          ],
        ),
      ),
    );
  }
}