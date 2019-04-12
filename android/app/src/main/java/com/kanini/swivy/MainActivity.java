package com.kanini.swivy;

import android.os.Bundle;
import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.PluginRegistry;
import io.flutter.plugins.GeneratedPluginRegistrant;
import io.flutter.plugin.platform.PlatformViewFactory;
import io.flutter.plugin.common.PluginRegistry.Registrar;
import io.flutter.plugin.common.PluginRegistry.Registrar;


public class MainActivity extends FlutterActivity {
  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    GeneratedPluginRegistrant.registerWith(this);

    Registrar reg = registrarFor("andoridView1");
    reg.platformViewRegistry().registerViewFactory("androidView", new FViewFactory(reg.messenger()));

  }
}
