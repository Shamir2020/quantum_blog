import 'package:flutter/material.dart';
import '../styles/styles.dart';
import '../RestApi/RestClient.dart';
import '../screens/BlogInsideScreen.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var BlogsList = [];
  bool loading = true;
  FetchFeaturedBlogs() async{
    var lists = await getFeaturedBlogs();
    setState(() {
      BlogsList = lists;
      loading = false;
    });
  }

  @override
  void initState() {
    FetchFeaturedBlogs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery .of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        foregroundColor: Colors.black,
        title: Text("Quantum Blog",style: TextHeading3(colorBlack),),
        elevation: 1,
      ),
      body: loading?Center(child: CircularProgressIndicator(),):SingleChildScrollView(

        child: Column(
          children: [
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap:(){},
                    child: CircleAvatar(
                      radius: width*0.11,
                      backgroundColor: Colors.greenAccent,
                      child: Text('Guides',style: TextHeading3(colorBlack),),
                    ),
                  ),
                  InkWell(
                    onTap:(){},
                    child: CircleAvatar(
                      radius: width*0.11,
                      backgroundColor: Colors.greenAccent,
                      child: Text('Stories',style: TextHeading3(colorBlack),),
                    ),
                  ),
                  InkWell(
                    onTap:(){
                      Navigator.pushNamed(context, 'blogsScreen');
                    },
                    child: CircleAvatar(
                      radius: width*0.11,
                      backgroundColor: Colors.greenAccent,
                      child: Text('Blogs',style: TextHeading3(colorBlack),),
                    ),
                  ),
                  InkWell(
                    onTap:(){},
                    child: CircleAvatar(
                      radius: width*0.11,
                      backgroundColor: Colors.greenAccent,
                      child: Text('Podcast',style: TextHeading3(colorBlack),),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10,),
            InkWell(
              onTap: (){},
              child: Container(
                margin: EdgeInsets.all(5),
                height: height*0.31,
                width: width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage("http://10.0.2.2:8000/${BlogsList[0]['image']}")
                    )
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(BlogsList[0]['title'],style: TextHeading3(colorWhite),),
                      const SizedBox(height: 10,),
                      Text(BlogsList[0]['description'],textAlign: TextAlign.justify,style: TextHeading5(colorWhite),),
                      SizedBox(height: 10,),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Text('Featured Blogs',style: TextHeading1(colorBlack),),
            Padding(
              padding: const EdgeInsets.all(5),
              child: GridView.builder(gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  mainAxisExtent: 250,
                  childAspectRatio: 3/2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10
              ),
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,

                  itemCount: BlogsList.length,
                  itemBuilder: (BuildContext context, index){
                    return InkWell(
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
                                padding: const EdgeInsets.all(5),
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
          ],
        ),
      ),
    );
  }
}
