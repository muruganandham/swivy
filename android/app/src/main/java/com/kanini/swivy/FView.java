package com.kanini.swivy;

import android.content.Context;
import android.view.View;

import com.mapbox.mapboxsdk.Mapbox;
import com.mapbox.mapboxsdk.maps.MapView;

import com.mapbox.mapboxsdk.maps.MapboxMap;
import com.mapbox.mapboxsdk.maps.OnMapReadyCallback;

import com.mapbox.mapboxsdk.maps.Style;

import androidx.annotation.NonNull;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.platform.PlatformView;

import static io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import static io.flutter.plugin.common.MethodChannel.Result;

public class FView implements PlatformView, MethodCallHandler  {
    private MapView mapView;
    private final MethodChannel methodChannel;
    private Context context;

    FView(Context context, BinaryMessenger messenger, int id) {

        mapView = getMapView(context);
        methodChannel = new MethodChannel(messenger, "androidView_" + id);
        methodChannel.setMethodCallHandler(this);
        this.context = context;
    }

    @Override
    public View getView() {

        return  mapView;
    }

    private MapView getMapView(Context context) {

        Mapbox.getInstance(context, "pk.eyJ1IjoibXVydWdhbmFuZGhhbTIzIiwiYSI6ImNqdTJweXFnejBkbjQzeW5yZmY3Y3dzdXIifQ.gWLo3-ulUwQPcrymXnu6dA");
        mapView = new MapView(context);
        mapView.getMapAsync(new OnMapReadyCallback() {
            @Override
            public void onMapReady(@NonNull MapboxMap mapboxMap) {
                mapboxMap.setStyle(Style.MAPBOX_STREETS, new Style.OnStyleLoaded() {
                    @Override
                    public void onStyleLoaded(@NonNull Style style) {

                    }
                });
            }
        });

        return mapView;
    }

    @Override
    public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {
                setText(methodCall, result);
    }

    private void setText(MethodCall methodCall, Result result) {
        //String text = (String) methodCall.arguments;
        result.success(null);
    }

    @Override
    public void dispose() {}
}
