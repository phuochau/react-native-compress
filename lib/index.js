"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
var react_native_1 = require("react-native");
var RNCompress = react_native_1.NativeModules.RNCompress;
if (!RNCompress) {
    throw new Error('RNCompress native module is not available');
}
exports.default = RNCompress;
