import 'package:flutter/material.dart';
import '../RestApi/RestClient.dart';
import '../styles/styles.dart';
import '../screens/BlogInsideScreen.dart';
class BlogsScreen extends StatefulWidget {
  const BlogsScreen({Key? key}) : super(key: key);

  @override
  State<BlogsScreen> createState() => _BlogsScreenState();
}

class _BlogsScreenState extends State<BlogsScreen> {
  var BlogsList = [];
  bool loading = true;
  FetchAllBlogs() async{
    var lists = await getAllBlogs();
    setState(() {
      BlogsList = lists;
      loading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    FetchAllBlogs();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        foregroundColor: Colors.black,
        title: Text("Quantum Blog",style: TextHeading3(colorBlack),),
        elevation: 1,
      ),
      body: loading?Center(child: CircularProgressIndicator(),):Padding(
        padding: const EdgeInsets.all(5.0),
        child: GridView.builder(gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            mainAxisExtent: 250,
            childAspectRatio: 3/2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10
        ),
            itemCount: BlogsList.length,
            itemBuilder: (BuildContext context, index){
              return InkWell(
                borderRadius: BorderRadius.circular(5),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>BlogInside(BlogsList[index])));
                },
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.greenAccent,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.network("http://10.0.2.2:8000/${BlogsList[index]['image']}",height:height*0.15,width: double.infinity,fit: BoxFit.cover,),
                      ),
                      Padding(
                          padding: EdgeInsets.all(5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(BlogsList[index]['updated_at'].toString(),style: SmallText(colorBlack),),
                              SizedBox(height: 5,),
                              Text(BlogsList[index]['title'],style: TextHeading5(colorBlack),),],
                          )
                      )
                    ],
                  ),
                ),

              );
            }),
      ),
    );
  }
}
