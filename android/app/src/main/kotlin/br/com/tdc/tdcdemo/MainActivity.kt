package br.com.tdc.tdcdemo

import android.os.Bundle
import android.util.Log

import io.flutter.app.FlutterActivity
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity() : FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        GeneratedPluginRegistrant.registerWith(this)

        val channel = MethodChannel(flutterView, "tdc_demo_channel")

        channel.setMethodCallHandler { call, result ->
            if (call.method == "getNativeText") {
                var resultString = getString(R.string.platform_string)
                resultString = "$resultString ${call.arguments}"

                channel.invokeMethod(
                        "getFlutterText",
                        getString(R.string.platform_parameter_string),
                        object : MethodChannel.Result {
                            override fun success(p0: Any?) {
                                resultString = "$resultString $p0"
                                result.success(resultString)
                            }

                            override fun error(p0: String?, p1: String?, p2: Any?) {
                            }

                            override fun notImplemented() {
                            }
                        })

            } else {
                result.notImplemented()
            }
        }
    }
}
