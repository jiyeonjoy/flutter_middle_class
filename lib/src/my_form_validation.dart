import 'package:flutter/material.dart';

class MyFormValidation extends StatefulWidget {
  @override
  _MyFormValidationState createState() => _MyFormValidationState();
}

class _MyFormValidationState extends State<MyFormValidation> {

  // 해당 글상자의 상태를 체크할 수 있게 해주는 전역변수
  final _formKey = GlobalKey<FormState>();
  // 버튼 누르면 포커스 지정해준 해당에디터로 이동하기 위한 전역변수
  FocusNode nameFocusNode;
  // 글상자의 텍스트를 컨트롤 하기위한 컨트롤러
  final nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // 생성
    nameFocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    // 해제 해줘야됨!!
    nameFocusNode.dispose();
    nameController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Validation'),
      ),
      // 글자 입력할 수 있는 TextFormField 꼭 에러 처리 위해 Form 안에 넣어야 함!!
      // Form 클래스를 보면 FormState 를 리턴하는 것을 알 수 있음. 활용해줘야함!!
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          // _formKey를 통해 State를 알 수 있게 지정해줌.
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                // 값이 들어왔을 때 지정할 수 있음
                validator: (value) {
                  if(value.isEmpty) {
                    return '공백은 허용되지 않습니다.';
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  child: Text('완료'),
                  onPressed: () {
                    if(_formKey.currentState.validate()) {
                      // valid
                      // 에러뜸, context 위에 Scaffold 만들때 써서 또쓰면 에러뜸

//                    Scaffold.of(context)
//                        .showSnackBar(SnackBar(content: Text('처리중')));
                      // 새로 빌더 해줘야되지만.
                      // 위에 _formKey가 context를 가지고 있어 그거 사용해주면 됨!!!
                      Scaffold.of(_formKey.currentContext)
                          .showSnackBar(SnackBar(content: Text('처리중')));
                    }
                  },
                ),
              ),
              // 텍스트 폼 필드와 거의 같음. TextField 는 그냥 입력 창.
              // validator 기능 없음. 나머지 동일!!
              TextField(
                controller: nameController,
                // 글자가 입력되어 바뀔때마다 실행되는 메소드
                onChanged: (text) {
                  print(text);
                },
                // nameFocusNode를 focusNode로 지정
                focusNode: nameFocusNode,
                // 여러 입력 창 중 해당 텍스트 필드에 커서가 놓임!!
                decoration: InputDecoration(
                  hintText: '이름을 입력해 주세요',
                  // 밑줄 생략
                  border: InputBorder.none,
                  labelText: '이름',
                ),
                autofocus: true,
              ),
              RaisedButton(
                onPressed: () {
                  // nameFocusNode로 포커스 이동!!
                  FocusScope.of(context).requestFocus(nameFocusNode);
                },
                child: Text('포커스'),),
              RaisedButton(
                onPressed: () {
                  // 글상자 text 값을 가져와서 프린트 함!!
                  print(nameController.text);
                  // 글상자 text 값을 가져와서 다이얼로그에 뿌림!!
                  showDialog(context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Text(nameController.text),
                      );
                    }
                  );
                },
                child: Text('TextField 값 확인'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
