import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class InfiniteScrollScreen extends StatefulWidget {
  static const name = 'inifnite_screen';
  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {

  List<int> imagesIds = [1,2,3,4,5];
  final ScrollController scrollController = ScrollController();
  bool isLoading = false;
  bool isMounted = true;

  @override
  void initState () {
    super.initState();
    scrollController.addListener(() {
      if ( scrollController.position.pixels + 500 >= scrollController.position.maxScrollExtent ){
        loadNextPage();
      } 
    });
  }

  @override
  void dispose () {
    isMounted = false;
    scrollController.dispose();
    super.dispose();
  }

  Future loadNextPage () async{
    if ( isLoading ) return;
    isLoading = true;
    setState(() {});

    await Future.delayed(const Duration(seconds: 2));
    addFiveImages();
    isLoading = false;

    if ( !isMounted ) return;

    setState(() {});
    moveScrollToBottom();
  }


  void moveScrollToBottom() {
    if(scrollController.position.pixels + 100 <= scrollController.position.maxScrollExtent) return ;

    scrollController.animateTo(
      scrollController.position.pixels + 120 ,
      duration: const Duration(milliseconds: 300),
      curve: Curves.fastOutSlowIn
    );
  }

  void addFiveImages () {
    final lastId = imagesIds.last;

    imagesIds.addAll(
      [1,2,3,4,5].map((e) => lastId + e).toList()
    );
  }

  Future<void> onRefresh () async {
    isLoading = true;
    setState(() {});

    await Future.delayed(const Duration(seconds: 3));
    if ( !isMounted ) return;

    isLoading = false;
    final lastId = imagesIds.last;
    imagesIds.clear();
    imagesIds.add(lastId + 1);
    addFiveImages();
    
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: MediaQuery.removePadding(
        removeTop: true,
        removeBottom: true,
        context: context,
        child: RefreshIndicator(
          edgeOffset: 10.0,
          strokeWidth: 2,
          onRefresh: onRefresh,
          child: ListView.builder(
            controller: scrollController,
            physics: const BouncingScrollPhysics(),
            itemCount: imagesIds.length,
            itemBuilder: (context, index) {
              return FadeInImage(
                fit: BoxFit.cover,
                width: double.infinity,
                height: 300,
                placeholder: const AssetImage('assets/images/jar-loading.gif'), 
                image:  NetworkImage('https://picsum.photos/id/${imagesIds[index]}/500/300'),
              );
            }
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>  context.pop(),
        child: isLoading ? 
        SpinPerfect(
          child: const Icon(Icons.refresh),
        )
        : FadeIn(
          child: const Icon(Icons.arrow_back_ios_new_outlined)
        ),
      ),
    );
  }
}