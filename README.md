
# react-native-compress
Compress local video for react native. Only for iOS, Android will be coming.

## Getting started

`$ npm install react-native-compress --save`

### Mostly automatic installation

`$ react-native link react-native-compress`

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-compress` and add `RNCompress.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNCompress.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

#### Android

1. Open up `android/app/src/main/java/[...]/MainActivity.java`
  - Add `import com.reactlibrary.RNCompressPackage;` to the imports at the top of the file
  - Add `new RNCompressPackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:
  	```
  	include ':react-native-compress'
  	project(':react-native-compress').projectDir = new File(rootProject.projectDir, 	'../node_modules/react-native-compress/android')
  	```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
  	```
      compile project(':react-native-compress')
  	```

## Usage
```javascript
import RNCompress from 'react-native-compress';
// quality will be "low", "medium" or "high"
RNCompress.compressVideo(filePath, quality)
```
