import 'package:flutter/material.dart';

class MySwipeToDismiss extends StatefulWidget {
  @override
  _MySwipeToDismissState createState() => _MySwipeToDismissState();
}

class _MySwipeToDismissState extends State<MySwipeToDismiss> {

  // 리스트 20개 자동 생성
  final items = List<String>.generate(20, (i) => "Item ${i + 1}");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Swipe To Dismiss'),
      ),
      body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            // 삭제 처리 , 키 값 있어야함.
            // 키 값 각각 고유의 값으로 지정해주면 됨.
            // UI 상으로만 삭제되는 것임 다시 들어오면 그대로임.
            return Dismissible(
              background: Container(color: Colors.red,),
              // 왼쪽에서 오른쪽으로 지정할 수 있음. 방향 지정 가능
              // 지정안하면 양쪽 모두 가능
              direction: DismissDirection.startToEnd,
              // 진짜 삭제 위한 것임. 근데 페이지 다시 들어오면 새로 생성되기 때문에 의미없음.
              onDismissed: (direction) {
                setState(() {
                  // 위에 direction 지정을 if 문으로 할 수 도 있음!!
//                  if(direction == DismissDirection.startToEnd) {
//                    items.removeAt(index);
//                  }
                  items.removeAt(index);
                });
              },
              child: ListTile(
                title: Text('${items[index]}'),
              ),
              key: Key(item),
            );
          }),
    );
  }
}
