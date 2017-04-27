
package com.hauvo.compress;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.Callback;
import com.facebook.react.bridge.Promise;
import com.facebook.react.bridge.Arguments;
import com.facebook.react.bridge.WritableMap;

public class RNCompressModule extends ReactContextBaseJavaModule {

  private final ReactApplicationContext reactContext;

  public RNCompressModule(ReactApplicationContext reactContext) {
    super(reactContext);
    this.reactContext = reactContext;
  }

  @Override
  public String getName() {
    return "RNCompress";
  }

  @ReactMethod
  public void compressVideo(String filePath, String quality, Promise promise) {
    // we can use ffmpeg-android library but it's commercial libraries
    WritableMap map = Arguments.createMap();
    map.putString("path", filePath);
    promise.resolve(map);
  }
}
