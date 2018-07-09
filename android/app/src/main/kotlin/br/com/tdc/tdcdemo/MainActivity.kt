package br.com.tdc.tdcdemo

import android.os.Bundle

import io.flutter.app.FlutterActivity
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity() : FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        GeneratedPluginRegistrant.registerWith(this)

        MethodChannel(flutterView, "tdc_demo_channel")
                .setMethodCallHandler { call, result ->
                    if (call.method == "getNativeText") {
                        result.success(getString(R.string.platform_string));
                    } else {
                        result.notImplemented();
                    }
                }
    }
}
