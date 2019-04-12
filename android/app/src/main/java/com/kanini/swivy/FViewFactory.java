package com.kanini.swivy;

import io.flutter.plugin.platform.PlatformViewFactory;

import android.content.Context;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.StandardMessageCodec;
import io.flutter.plugin.platform.PlatformView;

public class FViewFactory extends PlatformViewFactory {
    private final BinaryMessenger messenger;

    public FViewFactory(BinaryMessenger messenger) {
        super(StandardMessageCodec.INSTANCE);
        this.messenger = messenger;
    }

    @Override
    public PlatformView create(Context context, int id, Object o) {
        return new FView(context, messenger, id);
    }
}