import { NativeModules } from 'react-native';

interface RNCompressInterface {
  compressImage(
    imagePath: string,
    options?: {
      quality?: number;
      maxWidth?: number;
      maxHeight?: number;
    }
  ): Promise<string>;
}

const { RNCompress } = NativeModules;

if (!RNCompress) {
  throw new Error('RNCompress native module is not available');
}

export default RNCompress as RNCompressInterface; 