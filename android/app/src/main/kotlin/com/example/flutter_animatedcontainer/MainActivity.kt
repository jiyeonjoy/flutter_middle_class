package com.example.flutter_animatedcontainer

import android.os.Bundle

import io.flutter.app.FlutterActivity
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity: FlutterActivity() {
  // 상수 정의
  companion object {
    const val CHANNEL = "example.com/value"
  }
  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)
    GeneratedPluginRegistrant.registerWith(this)
    // 메소드 채널 생성
    MethodChannel(flutterView, CHANNEL)
            .setMethodCallHandler { methodCall, result ->
              if(methodCall.method == "getValue") {
                  // result 를 통해 flutter 로 값 전달
                result.success("성공")
              } else {
                result.notImplemented()
              }
            }

  }
}
