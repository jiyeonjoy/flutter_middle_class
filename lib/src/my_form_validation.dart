import 'package:flutter/material.dart';

class MyFormValidation extends StatefulWidget {
  @override
  _MyFormValidationState createState() => _MyFormValidationState();
}

class _MyFormValidationState extends State<MyFormValidation> {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Validation'),
      ),
      // 글자 입력할 수 있는 TextFormField 꼭 에러 처리 위해 Form 안에 넣어야 함!!
      // Form 클래스를 보면 FormState 를 리턴하는 것을 알 수 있음. 활용해줘야함!!
      body: Form(
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
            )
          ],
        ),
      ),
    );
  }
}
