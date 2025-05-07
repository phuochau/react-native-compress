interface RNCompressInterface {
    compressImage(imagePath: string, options?: {
        quality?: number;
        maxWidth?: number;
        maxHeight?: number;
    }): Promise<string>;
}
declare const _default: RNCompressInterface;
export default _default;
