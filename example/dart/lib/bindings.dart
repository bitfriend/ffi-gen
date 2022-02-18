// AUTO GENERATED FILE, DO NOT EDIT.
//
// Generated by "ffi-gen".

library api;

import "dart:async";
import "dart:convert";
import "dart:ffi" as ffi;
import "dart:io" show Platform;
import "dart:isolate";
import "dart:typed_data";

class _DartApiEntry extends ffi.Struct {
  external ffi.Pointer<ffi.Uint8> name;
  external ffi.Pointer<ffi.Void> ptr;
}

class _DartApi extends ffi.Struct {
  @ffi.Int32()
  external int major;

  @ffi.Int32()
  external int minor;

  external ffi.Pointer<_DartApiEntry> functions;
}

ffi.Pointer<T> _lookupDartSymbol<T extends ffi.NativeType>(String symbol) {
  final ffi.Pointer<_DartApi> api = ffi.NativeApi.initializeApiDLData.cast();
  final ffi.Pointer<_DartApiEntry> functions = api.ref.functions;
  for (var i = 0; i < 100; i++) {
    final func = functions.elementAt(i).ref;
    var symbol2 = "";
    var j = 0;
    while (func.name.elementAt(j).value != 0) {
      symbol2 += String.fromCharCode(func.name.elementAt(j).value);
      j += 1;
    }
    if (symbol == symbol2) {
      return func.ptr.cast();
    }
  }
  throw "symbol not found";
}

class _Box {
  final Api _api;
  final ffi.Pointer<ffi.Void> _ptr;
  final String _dropSymbol;
  bool _dropped;
  bool _moved;
  ffi.Pointer<ffi.Void> _finalizer = ffi.Pointer.fromAddress(0);

  _Box(this._api, this._ptr, this._dropSymbol)
      : _dropped = false,
        _moved = false;

  late final _dropPtr = _api._lookup<
      ffi.NativeFunction<
          ffi.Void Function(
              ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>>(_dropSymbol);

  late final _drop = _dropPtr.asFunction<
      void Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Void>)>();

  int borrow() {
    if (_dropped) {
      throw StateError("use after free");
    }
    if (_moved) {
      throw StateError("use after move");
    }
    return _ptr.address;
  }

  int move() {
    if (_dropped) {
      throw StateError("use after free");
    }
    if (_moved) {
      throw StateError("can't move value twice");
    }
    _moved = true;
    _api._unregisterFinalizer(this);
    return _ptr.address;
  }

  void drop() {
    if (_dropped) {
      throw StateError("double free");
    }
    if (_moved) {
      throw StateError("can't drop moved value");
    }
    _dropped = true;
    _api._unregisterFinalizer(this);
    _drop(ffi.Pointer.fromAddress(0), _ptr);
  }
}

class FfiBufferInt8 {
  final Api _api;
  final _Box _box;

  FfiBufferInt8._(this._api, this._box);

  void drop() {
    _box.drop();
  }

  Int8List toInt8List() {
    final buffer = _box.borrow();
    final addressRaw = _api._ffiBufferAddress(buffer).address;
    final size = _api._ffiBufferSize(buffer) ~/ 1;
    return ffi.Pointer<ffi.Int8>.fromAddress(addressRaw).asTypedList(size);
  }
}

class FfiBufferUint8 {
  final Api _api;
  final _Box _box;

  FfiBufferUint8._(this._api, this._box);

  void drop() {
    _box.drop();
  }

  Uint8List toUint8List() {
    final buffer = _box.borrow();
    final addressRaw = _api._ffiBufferAddress(buffer).address;
    final size = _api._ffiBufferSize(buffer) ~/ 1;
    return ffi.Pointer<ffi.Uint8>.fromAddress(addressRaw).asTypedList(size);
  }
}

class FfiBufferInt16 {
  final Api _api;
  final _Box _box;

  FfiBufferInt16._(this._api, this._box);

  void drop() {
    _box.drop();
  }

  Int16List toInt16List() {
    final buffer = _box.borrow();
    final addressRaw = _api._ffiBufferAddress(buffer).address;
    final size = _api._ffiBufferSize(buffer) ~/ 2;
    return ffi.Pointer<ffi.Int16>.fromAddress(addressRaw).asTypedList(size);
  }
}

class FfiBufferUint16 {
  final Api _api;
  final _Box _box;

  FfiBufferUint16._(this._api, this._box);

  void drop() {
    _box.drop();
  }

  Uint16List toUint16List() {
    final buffer = _box.borrow();
    final addressRaw = _api._ffiBufferAddress(buffer).address;
    final size = _api._ffiBufferSize(buffer) ~/ 2;
    return ffi.Pointer<ffi.Uint16>.fromAddress(addressRaw).asTypedList(size);
  }
}

class FfiBufferInt32 {
  final Api _api;
  final _Box _box;

  FfiBufferInt32._(this._api, this._box);

  void drop() {
    _box.drop();
  }

  Int32List toInt32List() {
    final buffer = _box.borrow();
    final addressRaw = _api._ffiBufferAddress(buffer).address;
    final size = _api._ffiBufferSize(buffer) ~/ 4;
    return ffi.Pointer<ffi.Int32>.fromAddress(addressRaw).asTypedList(size);
  }
}

class FfiBufferUint32 {
  final Api _api;
  final _Box _box;

  FfiBufferUint32._(this._api, this._box);

  void drop() {
    _box.drop();
  }

  Uint32List toUint32List() {
    final buffer = _box.borrow();
    final addressRaw = _api._ffiBufferAddress(buffer).address;
    final size = _api._ffiBufferSize(buffer) ~/ 4;
    return ffi.Pointer<ffi.Uint32>.fromAddress(addressRaw).asTypedList(size);
  }
}

class FfiBufferInt64 {
  final Api _api;
  final _Box _box;

  FfiBufferInt64._(this._api, this._box);

  void drop() {
    _box.drop();
  }

  Int64List toInt64List() {
    final buffer = _box.borrow();
    final addressRaw = _api._ffiBufferAddress(buffer).address;
    final size = _api._ffiBufferSize(buffer) ~/ 8;
    return ffi.Pointer<ffi.Int64>.fromAddress(addressRaw).asTypedList(size);
  }
}

class FfiBufferUint64 {
  final Api _api;
  final _Box _box;

  FfiBufferUint64._(this._api, this._box);

  void drop() {
    _box.drop();
  }

  Uint64List toUint64List() {
    final buffer = _box.borrow();
    final addressRaw = _api._ffiBufferAddress(buffer).address;
    final size = _api._ffiBufferSize(buffer) ~/ 8;
    return ffi.Pointer<ffi.Uint64>.fromAddress(addressRaw).asTypedList(size);
  }
}

class FfiBufferFloat32 {
  final Api _api;
  final _Box _box;

  FfiBufferFloat32._(this._api, this._box);

  void drop() {
    _box.drop();
  }

  Float32List toFloat32List() {
    final buffer = _box.borrow();
    final addressRaw = _api._ffiBufferAddress(buffer).address;
    final size = _api._ffiBufferSize(buffer) ~/ 4;
    return ffi.Pointer<ffi.Float>.fromAddress(addressRaw).asTypedList(size);
  }
}

class FfiBufferFloat64 {
  final Api _api;
  final _Box _box;

  FfiBufferFloat64._(this._api, this._box);

  void drop() {
    _box.drop();
  }

  Float64List toFloat64List() {
    final buffer = _box.borrow();
    final addressRaw = _api._ffiBufferAddress(buffer).address;
    final size = _api._ffiBufferSize(buffer) ~/ 8;
    return ffi.Pointer<ffi.Double>.fromAddress(addressRaw).asTypedList(size);
  }
}

/// Implements Iterable and Iterator for a rust iterator.
class Iter<T> extends Iterable<T> implements Iterator<T> {
  final _Box _box;
  final T? Function(int) _next;

  Iter._(this._box, this._next);

  @override
  Iterator<T> get iterator => this;

  T? _current;

  @override
  T get current => _current!;

  @override
  bool moveNext() {
    final next = _next(_box.borrow());
    if (next == null) {
      return false;
    } else {
      _current = next;
      return true;
    }
  }

  void drop() {
    _box.drop();
  }
}

abstract class CustomIterable<T> {
  int get length;
  T elementAt(int index);
}

class CustomIterator<T, U extends CustomIterable<T>> implements Iterator<T> {
  final U _iterable;
  int _currentIndex = -1;

  CustomIterator(this._iterable);

  @override
  T get current => _iterable.elementAt(_currentIndex);

  @override
  bool moveNext() {
    _currentIndex++;
    return _currentIndex < _iterable.length;
  }
}

Future<T> _nativeFuture<T>(_Box box, T? Function(int, int, int) nativePoll) {
  final completer = Completer<T>();
  final rx = ReceivePort();
  void poll() {
    try {
      final ret = nativePoll(box.borrow(), ffi.NativeApi.postCObject.address,
          rx.sendPort.nativePort);
      if (ret == null) {
        return;
      }
      completer.complete(ret);
    } catch (err) {
      completer.completeError(err);
    }
    rx.close();
    box.drop();
  }

  rx.listen((dynamic _message) => poll());
  poll();
  return completer.future;
}

Stream<T> _nativeStream<T>(
    _Box box, T? Function(int, int, int, int) nativePoll) {
  final controller = StreamController<T>();
  final rx = ReceivePort();
  final done = ReceivePort();
  void poll() {
    try {
      final ret = nativePoll(
        box.borrow(),
        ffi.NativeApi.postCObject.address,
        rx.sendPort.nativePort,
        done.sendPort.nativePort,
      );
      if (ret != null) {
        controller.add(ret);
      }
    } catch (err) {
      controller.addError(err);
    }
  }

  void close() {
    rx.close();
    done.close();
    box.drop();
  }

  controller.onCancel = close;
  rx.listen((dynamic _message) => poll());
  done.listen((dynamic _message) => controller.close());
  poll();
  return controller.stream;
}

/// Main entry point to library.
class Api {
  /// Holds the symbol lookup function.
  final ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName)
      _lookup;

  /// The symbols are looked up in [dynamicLibrary].
  Api(ffi.DynamicLibrary dynamicLibrary) : _lookup = dynamicLibrary.lookup;

  /// The symbols are looked up with [lookup].
  Api.fromLookup(
      ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName)
          lookup)
      : _lookup = lookup;

  /// The library is loaded from the executable.
  factory Api.loadStatic() {
    return Api(ffi.DynamicLibrary.executable());
  }

  /// The library is dynamically loaded.
  factory Api.loadDynamic(String name) {
    return Api(ffi.DynamicLibrary.open(name));
  }

  /// The library is loaded based on platform conventions.
  factory Api.load() {
    String? name;
    if (Platform.isLinux) name = "libapi.so";
    if (Platform.isAndroid) name = "libapi.so";
    if (Platform.isMacOS) name = "libapi.dylib";
    if (Platform.isIOS) name = "";
    if (Platform.isWindows) name = "api.dll";
    if (name == null) {
      throw UnsupportedError("\"This platform is not supported.\"");
    }
    if (name == "") {
      return Api.loadStatic();
    } else {
      return Api.loadDynamic(name);
    }
  }

  late final _registerPtr = _lookupDartSymbol<
      ffi.NativeFunction<
          ffi.Pointer<ffi.Void> Function(ffi.Handle, ffi.Pointer<ffi.Void>,
              ffi.IntPtr, ffi.Pointer<ffi.Void>)>>("Dart_NewFinalizableHandle");

  late final _register = _registerPtr.asFunction<
      ffi.Pointer<ffi.Void> Function(
          Object, ffi.Pointer<ffi.Void>, int, ffi.Pointer<ffi.Void>)>();

  ffi.Pointer<ffi.Void> _registerFinalizer(_Box boxed) {
    return _register(boxed, boxed._ptr, 42, boxed._dropPtr.cast());
  }

  late final _unregisterPtr = _lookupDartSymbol<
      ffi.NativeFunction<
          ffi.Void Function(ffi.Pointer<ffi.Void>,
              ffi.Handle)>>("Dart_DeleteFinalizableHandle");

  late final _unregister =
      _unregisterPtr.asFunction<void Function(ffi.Pointer<ffi.Void>, _Box)>();

  void _unregisterFinalizer(_Box boxed) {
    _unregister(boxed._finalizer, boxed);
  }

  ffi.Pointer<T> __allocate<T extends ffi.NativeType>(
      int byteCount, int alignment) {
    return _allocate(byteCount, alignment).cast();
  }

  void __deallocate<T extends ffi.NativeType>(
      ffi.Pointer pointer, int byteCount, int alignment) {
    _deallocate(pointer.cast(), byteCount, alignment);
  }

  void helloWorld() {
    _helloWorld();
    return;
  }

  Future<int> asyncHelloWorld() {
    final tmp0 = _asyncHelloWorld();
    final tmp2 = tmp0;
    final ffi.Pointer<ffi.Void> tmp2_0 = ffi.Pointer.fromAddress(tmp2);
    final tmp2_1 = _Box(this, tmp2_0, "__async_hello_world_future_drop");
    tmp2_1._finalizer = this._registerFinalizer(tmp2_1);
    final tmp1 = _nativeFuture(tmp2_1, this.__asyncHelloWorldFuturePoll);
    return tmp1;
  }

  FfiBufferUint8 getImage() {
    final tmp0 = _getImage();
    final tmp2 = tmp0;
    final ffi.Pointer<ffi.Void> tmp2_0 = ffi.Pointer.fromAddress(tmp2);
    final tmp2_1 = _Box(this, tmp2_0, "drop_box_FfiBuffer");
    tmp2_1._finalizer = this._registerFinalizer(tmp2_1);
    final tmp3 = FfiBufferUint8._(this, tmp2_1);
    final tmp1 = tmp3;
    return tmp1;
  }

  DataTest create(
    int n,
  ) {
    final tmp0 = n;
    var tmp1 = 0;
    tmp1 = tmp0;
    final tmp2 = _create(
      tmp1,
    );
    final tmp4 = tmp2;
    final ffi.Pointer<ffi.Void> tmp4_0 = ffi.Pointer.fromAddress(tmp4);
    final tmp4_1 = _Box(this, tmp4_0, "drop_box_DataTest");
    tmp4_1._finalizer = this._registerFinalizer(tmp4_1);
    final tmp3 = DataTest._(this, tmp4_1);
    return tmp3;
  }

  FfiBufferUint8 getU8Counting(
    int n,
  ) {
    final tmp0 = n;
    var tmp1 = 0;
    tmp1 = tmp0;
    final tmp2 = _getU8Counting(
      tmp1,
    );
    final tmp4 = tmp2;
    final ffi.Pointer<ffi.Void> tmp4_0 = ffi.Pointer.fromAddress(tmp4);
    final tmp4_1 = _Box(this, tmp4_0, "drop_box_FfiBuffer");
    tmp4_1._finalizer = this._registerFinalizer(tmp4_1);
    final tmp5 = FfiBufferUint8._(this, tmp4_1);
    final tmp3 = tmp5;
    return tmp3;
  }

  FfiBufferUint16 getU16Counting(
    int n,
  ) {
    final tmp0 = n;
    var tmp1 = 0;
    tmp1 = tmp0;
    final tmp2 = _getU16Counting(
      tmp1,
    );
    final tmp4 = tmp2;
    final ffi.Pointer<ffi.Void> tmp4_0 = ffi.Pointer.fromAddress(tmp4);
    final tmp4_1 = _Box(this, tmp4_0, "drop_box_FfiBuffer");
    tmp4_1._finalizer = this._registerFinalizer(tmp4_1);
    final tmp5 = FfiBufferUint16._(this, tmp4_1);
    final tmp3 = tmp5;
    return tmp3;
  }

  FfiBufferUint32 getU32Counting(
    int n,
  ) {
    final tmp0 = n;
    var tmp1 = 0;
    tmp1 = tmp0;
    final tmp2 = _getU32Counting(
      tmp1,
    );
    final tmp4 = tmp2;
    final ffi.Pointer<ffi.Void> tmp4_0 = ffi.Pointer.fromAddress(tmp4);
    final tmp4_1 = _Box(this, tmp4_0, "drop_box_FfiBuffer");
    tmp4_1._finalizer = this._registerFinalizer(tmp4_1);
    final tmp5 = FfiBufferUint32._(this, tmp4_1);
    final tmp3 = tmp5;
    return tmp3;
  }

  FfiBufferUint64 getU64Counting(
    int n,
  ) {
    final tmp0 = n;
    var tmp1 = 0;
    tmp1 = tmp0;
    final tmp2 = _getU64Counting(
      tmp1,
    );
    final tmp4 = tmp2;
    final ffi.Pointer<ffi.Void> tmp4_0 = ffi.Pointer.fromAddress(tmp4);
    final tmp4_1 = _Box(this, tmp4_0, "drop_box_FfiBuffer");
    tmp4_1._finalizer = this._registerFinalizer(tmp4_1);
    final tmp5 = FfiBufferUint64._(this, tmp4_1);
    final tmp3 = tmp5;
    return tmp3;
  }

  FfiBufferInt8 getI8Counting(
    int n,
  ) {
    final tmp0 = n;
    var tmp1 = 0;
    tmp1 = tmp0;
    final tmp2 = _getI8Counting(
      tmp1,
    );
    final tmp4 = tmp2;
    final ffi.Pointer<ffi.Void> tmp4_0 = ffi.Pointer.fromAddress(tmp4);
    final tmp4_1 = _Box(this, tmp4_0, "drop_box_FfiBuffer");
    tmp4_1._finalizer = this._registerFinalizer(tmp4_1);
    final tmp5 = FfiBufferInt8._(this, tmp4_1);
    final tmp3 = tmp5;
    return tmp3;
  }

  FfiBufferInt16 getI16Counting(
    int n,
  ) {
    final tmp0 = n;
    var tmp1 = 0;
    tmp1 = tmp0;
    final tmp2 = _getI16Counting(
      tmp1,
    );
    final tmp4 = tmp2;
    final ffi.Pointer<ffi.Void> tmp4_0 = ffi.Pointer.fromAddress(tmp4);
    final tmp4_1 = _Box(this, tmp4_0, "drop_box_FfiBuffer");
    tmp4_1._finalizer = this._registerFinalizer(tmp4_1);
    final tmp5 = FfiBufferInt16._(this, tmp4_1);
    final tmp3 = tmp5;
    return tmp3;
  }

  FfiBufferInt32 getI32Counting(
    int n,
  ) {
    final tmp0 = n;
    var tmp1 = 0;
    tmp1 = tmp0;
    final tmp2 = _getI32Counting(
      tmp1,
    );
    final tmp4 = tmp2;
    final ffi.Pointer<ffi.Void> tmp4_0 = ffi.Pointer.fromAddress(tmp4);
    final tmp4_1 = _Box(this, tmp4_0, "drop_box_FfiBuffer");
    tmp4_1._finalizer = this._registerFinalizer(tmp4_1);
    final tmp5 = FfiBufferInt32._(this, tmp4_1);
    final tmp3 = tmp5;
    return tmp3;
  }

  FfiBufferInt64 getI64Counting(
    int n,
  ) {
    final tmp0 = n;
    var tmp1 = 0;
    tmp1 = tmp0;
    final tmp2 = _getI64Counting(
      tmp1,
    );
    final tmp4 = tmp2;
    final ffi.Pointer<ffi.Void> tmp4_0 = ffi.Pointer.fromAddress(tmp4);
    final tmp4_1 = _Box(this, tmp4_0, "drop_box_FfiBuffer");
    tmp4_1._finalizer = this._registerFinalizer(tmp4_1);
    final tmp5 = FfiBufferInt64._(this, tmp4_1);
    final tmp3 = tmp5;
    return tmp3;
  }

  FfiBufferFloat32 getF32Counting(
    int n,
  ) {
    final tmp0 = n;
    var tmp1 = 0;
    tmp1 = tmp0;
    final tmp2 = _getF32Counting(
      tmp1,
    );
    final tmp4 = tmp2;
    final ffi.Pointer<ffi.Void> tmp4_0 = ffi.Pointer.fromAddress(tmp4);
    final tmp4_1 = _Box(this, tmp4_0, "drop_box_FfiBuffer");
    tmp4_1._finalizer = this._registerFinalizer(tmp4_1);
    final tmp5 = FfiBufferFloat32._(this, tmp4_1);
    final tmp3 = tmp5;
    return tmp3;
  }

  FfiBufferFloat64 getF64Counting(
    int n,
  ) {
    final tmp0 = n;
    var tmp1 = 0;
    tmp1 = tmp0;
    final tmp2 = _getF64Counting(
      tmp1,
    );
    final tmp4 = tmp2;
    final ffi.Pointer<ffi.Void> tmp4_0 = ffi.Pointer.fromAddress(tmp4);
    final tmp4_1 = _Box(this, tmp4_0, "drop_box_FfiBuffer");
    tmp4_1._finalizer = this._registerFinalizer(tmp4_1);
    final tmp5 = FfiBufferFloat64._(this, tmp4_1);
    final tmp3 = tmp5;
    return tmp3;
  }

  FfiListCustomType createList() {
    final tmp0 = _createList();
    final tmp2 = tmp0;
    final ffi.Pointer<ffi.Void> tmp2_0 = ffi.Pointer.fromAddress(tmp2);
    final tmp2_1 = _Box(this, tmp2_0, "drop_box_FfiListCustomType");
    tmp2_1._finalizer = this._registerFinalizer(tmp2_1);
    final tmp3 = FfiListCustomType._(this, tmp2_1);
    final tmp1 = tmp3;
    return tmp1;
  }

  int sumList(
    FfiListCustomType l,
  ) {
    final tmp0 = l;
    var tmp1 = 0;
    tmp1 = tmp0._box.move();
    final tmp2 = _sumList(
      tmp1,
    );
    final tmp4 = tmp2;
    final tmp3 = tmp4;
    return tmp3;
  }

  late final _allocatePtr = _lookup<
      ffi.NativeFunction<
          ffi.Pointer<ffi.Uint8> Function(ffi.IntPtr, ffi.IntPtr)>>("allocate");

  late final _allocate =
      _allocatePtr.asFunction<ffi.Pointer<ffi.Uint8> Function(int, int)>();

  late final _deallocatePtr = _lookup<
      ffi.NativeFunction<
          ffi.Void Function(
              ffi.Pointer<ffi.Uint8>, ffi.IntPtr, ffi.IntPtr)>>("deallocate");

  late final _deallocate = _deallocatePtr
      .asFunction<void Function(ffi.Pointer<ffi.Uint8>, int, int)>();

  late final _ffiBufferAddressPtr =
      _lookup<ffi.NativeFunction<ffi.Pointer<ffi.Uint8> Function(ffi.IntPtr)>>(
          "__ffi_buffer_address");

  late final _ffiBufferAddress =
      _ffiBufferAddressPtr.asFunction<ffi.Pointer<ffi.Uint8> Function(int)>();

  late final _ffiBufferSizePtr =
      _lookup<ffi.NativeFunction<ffi.Uint32 Function(ffi.IntPtr)>>(
          "__ffi_buffer_size");

  late final _ffiBufferSize = _ffiBufferSizePtr.asFunction<int Function(int)>();

  int? __asyncHelloWorldFuturePoll(
    int boxed,
    int postCobject,
    int port,
  ) {
    final tmp0 = boxed;
    final tmp2 = postCobject;
    final tmp4 = port;
    var tmp1 = 0;
    var tmp3 = 0;
    var tmp5 = 0;
    tmp1 = tmp0;
    tmp3 = tmp2;
    tmp5 = tmp4;
    final tmp6 = _asyncHelloWorldFuturePoll(
      tmp1,
      tmp3,
      tmp5,
    );
    final tmp8 = tmp6.arg0;
    final tmp9 = tmp6.arg1;
    final tmp10 = tmp6.arg2;
    final tmp11 = tmp6.arg3;
    final tmp12 = tmp6.arg4;
    final tmp13 = tmp6.arg5;
    if (tmp8 == 0) {
      return null;
    }
    if (tmp9 == 0) {
      final ffi.Pointer<ffi.Uint8> tmp10_0 = ffi.Pointer.fromAddress(tmp10);
      final tmp9_0 = utf8.decode(tmp10_0.asTypedList(tmp11));
      if (tmp11 > 0) {
        final ffi.Pointer<ffi.Void> tmp10_0;
        tmp10_0 = ffi.Pointer.fromAddress(tmp10);
        this.__deallocate(tmp10_0, tmp12, 1);
      }
      throw tmp9_0;
    }
    final tmp7 = tmp13;
    return tmp7;
  }

  late final _helloWorldPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function()>>("__hello_world");

  late final _helloWorld = _helloWorldPtr.asFunction<void Function()>();
  late final _asyncHelloWorldPtr =
      _lookup<ffi.NativeFunction<ffi.Int64 Function()>>("__async_hello_world");

  late final _asyncHelloWorld =
      _asyncHelloWorldPtr.asFunction<int Function()>();
  late final _getImagePtr =
      _lookup<ffi.NativeFunction<ffi.Int64 Function()>>("__get_image");

  late final _getImage = _getImagePtr.asFunction<int Function()>();
  late final _createPtr = _lookup<
      ffi.NativeFunction<
          ffi.Int64 Function(
    ffi.Uint64,
  )>>("__create");

  late final _create = _createPtr.asFunction<
      int Function(
    int,
  )>();
  late final _getU8CountingPtr = _lookup<
      ffi.NativeFunction<
          ffi.Int64 Function(
    ffi.Uint64,
  )>>("__get_u8_counting");

  late final _getU8Counting = _getU8CountingPtr.asFunction<
      int Function(
    int,
  )>();
  late final _getU16CountingPtr = _lookup<
      ffi.NativeFunction<
          ffi.Int64 Function(
    ffi.Uint64,
  )>>("__get_u16_counting");

  late final _getU16Counting = _getU16CountingPtr.asFunction<
      int Function(
    int,
  )>();
  late final _getU32CountingPtr = _lookup<
      ffi.NativeFunction<
          ffi.Int64 Function(
    ffi.Uint64,
  )>>("__get_u32_counting");

  late final _getU32Counting = _getU32CountingPtr.asFunction<
      int Function(
    int,
  )>();
  late final _getU64CountingPtr = _lookup<
      ffi.NativeFunction<
          ffi.Int64 Function(
    ffi.Uint64,
  )>>("__get_u64_counting");

  late final _getU64Counting = _getU64CountingPtr.asFunction<
      int Function(
    int,
  )>();
  late final _getI8CountingPtr = _lookup<
      ffi.NativeFunction<
          ffi.Int64 Function(
    ffi.Uint64,
  )>>("__get_i8_counting");

  late final _getI8Counting = _getI8CountingPtr.asFunction<
      int Function(
    int,
  )>();
  late final _getI16CountingPtr = _lookup<
      ffi.NativeFunction<
          ffi.Int64 Function(
    ffi.Uint64,
  )>>("__get_i16_counting");

  late final _getI16Counting = _getI16CountingPtr.asFunction<
      int Function(
    int,
  )>();
  late final _getI32CountingPtr = _lookup<
      ffi.NativeFunction<
          ffi.Int64 Function(
    ffi.Uint64,
  )>>("__get_i32_counting");

  late final _getI32Counting = _getI32CountingPtr.asFunction<
      int Function(
    int,
  )>();
  late final _getI64CountingPtr = _lookup<
      ffi.NativeFunction<
          ffi.Int64 Function(
    ffi.Uint64,
  )>>("__get_i64_counting");

  late final _getI64Counting = _getI64CountingPtr.asFunction<
      int Function(
    int,
  )>();
  late final _getF32CountingPtr = _lookup<
      ffi.NativeFunction<
          ffi.Int64 Function(
    ffi.Uint64,
  )>>("__get_f32_counting");

  late final _getF32Counting = _getF32CountingPtr.asFunction<
      int Function(
    int,
  )>();
  late final _getF64CountingPtr = _lookup<
      ffi.NativeFunction<
          ffi.Int64 Function(
    ffi.Uint64,
  )>>("__get_f64_counting");

  late final _getF64Counting = _getF64CountingPtr.asFunction<
      int Function(
    int,
  )>();
  late final _createListPtr =
      _lookup<ffi.NativeFunction<ffi.Int64 Function()>>("__create_list");

  late final _createList = _createListPtr.asFunction<int Function()>();
  late final _sumListPtr = _lookup<
      ffi.NativeFunction<
          ffi.Uint32 Function(
    ffi.Int64,
  )>>("__sum_list");

  late final _sumList = _sumListPtr.asFunction<
      int Function(
    int,
  )>();
  late final _dataTestGetCopyPtr = _lookup<
      ffi.NativeFunction<
          _DataTestGetCopyReturn Function(
    ffi.Int64,
  )>>("__DataTest_get_copy");

  late final _dataTestGetCopy = _dataTestGetCopyPtr.asFunction<
      _DataTestGetCopyReturn Function(
    int,
  )>();
  late final _dataTestGetShmemPtr = _lookup<
      ffi.NativeFunction<
          ffi.Int64 Function(
    ffi.Int64,
  )>>("__DataTest_get_shmem");

  late final _dataTestGetShmem = _dataTestGetShmemPtr.asFunction<
      int Function(
    int,
  )>();
  late final _customTypeGetNPtr = _lookup<
      ffi.NativeFunction<
          ffi.Int32 Function(
    ffi.Int64,
  )>>("__CustomType_get_n");

  late final _customTypeGetN = _customTypeGetNPtr.asFunction<
      int Function(
    int,
  )>();
  late final _asyncHelloWorldFuturePollPtr = _lookup<
      ffi.NativeFunction<
          _AsyncHelloWorldFuturePollReturn Function(
    ffi.Int64,
    ffi.Int64,
    ffi.Int64,
  )>>("__async_hello_world_future_poll");

  late final _asyncHelloWorldFuturePoll =
      _asyncHelloWorldFuturePollPtr.asFunction<
          _AsyncHelloWorldFuturePollReturn Function(
    int,
    int,
    int,
  )>();
  FfiListCustomType createFfiListCustomType() {
    final ffi.Pointer<ffi.Void> list_ptr =
        ffi.Pointer.fromAddress(_ffiListCustomTypeCreate());
    final list_box = _Box(this, list_ptr, "drop_box_FfiListCustomType");
    return FfiListCustomType._(this, list_box);
  }

  late final _ffiListCustomTypeCreatePtr =
      _lookup<ffi.NativeFunction<ffi.IntPtr Function()>>(
          "__FfiListCustomTypeCreate");

  late final _ffiListCustomTypeCreate =
      _ffiListCustomTypeCreatePtr.asFunction<int Function()>();

  late final _ffiListCustomTypeLenPtr =
      _lookup<ffi.NativeFunction<ffi.Uint32 Function(ffi.IntPtr)>>(
          "__FfiListCustomTypeLen");

  late final _ffiListCustomTypeLen =
      _ffiListCustomTypeLenPtr.asFunction<int Function(int)>();

  late final _ffiListCustomTypeElementAtPtr =
      _lookup<ffi.NativeFunction<ffi.IntPtr Function(ffi.IntPtr, ffi.Uint32)>>(
          "__FfiListCustomTypeElementAt");

  late final _ffiListCustomTypeElementAt =
      _ffiListCustomTypeElementAtPtr.asFunction<int Function(int, int)>();
}

class DataTest {
  final Api _api;
  final _Box _box;

  DataTest._(this._api, this._box);

  List<int> getCopy() {
    var tmp0 = 0;
    tmp0 = _box.borrow();
    final tmp1 = _api._dataTestGetCopy(
      tmp0,
    );
    final tmp3 = tmp1.arg0;
    final tmp4 = tmp1.arg1;
    final tmp5 = tmp1.arg2;
    final ffi.Pointer<ffi.Uint8> tmp3_0 = ffi.Pointer.fromAddress(tmp3);
    final tmp2 = tmp3_0.asTypedList(tmp4).toList();
    if (tmp5 > 0) {
      final ffi.Pointer<ffi.Void> tmp3_0;
      tmp3_0 = ffi.Pointer.fromAddress(tmp3);
      _api.__deallocate(tmp3_0, tmp5 * 1, 1);
    }
    return tmp2;
  }

  FfiBufferUint8 getShmem() {
    var tmp0 = 0;
    tmp0 = _box.borrow();
    final tmp1 = _api._dataTestGetShmem(
      tmp0,
    );
    final tmp3 = tmp1;
    final ffi.Pointer<ffi.Void> tmp3_0 = ffi.Pointer.fromAddress(tmp3);
    final tmp3_1 = _Box(_api, tmp3_0, "drop_box_FfiBuffer");
    tmp3_1._finalizer = _api._registerFinalizer(tmp3_1);
    final tmp4 = FfiBufferUint8._(_api, tmp3_1);
    final tmp2 = tmp4;
    return tmp2;
  }

  /// Manually drops the object and unregisters the FinalizableHandle.
  void drop() {
    _box.drop();
  }
}

class CustomType {
  final Api _api;
  final _Box _box;

  CustomType._(this._api, this._box);

  int getN() {
    var tmp0 = 0;
    tmp0 = _box.borrow();
    final tmp1 = _api._customTypeGetN(
      tmp0,
    );
    final tmp3 = tmp1;
    final tmp2 = tmp3;
    return tmp2;
  }

  /// Manually drops the object and unregisters the FinalizableHandle.
  void drop() {
    _box.drop();
  }
}

class _DataTestGetCopyReturn extends ffi.Struct {
  @ffi.Int64()
  external int arg0;
  @ffi.Uint64()
  external int arg1;
  @ffi.Uint64()
  external int arg2;
}

class _AsyncHelloWorldFuturePollReturn extends ffi.Struct {
  @ffi.Uint8()
  external int arg0;
  @ffi.Uint8()
  external int arg1;
  @ffi.Int64()
  external int arg2;
  @ffi.Uint64()
  external int arg3;
  @ffi.Uint64()
  external int arg4;
  @ffi.Uint8()
  external int arg5;
}

class FfiListCustomType extends Iterable<CustomType>
    implements CustomIterable<CustomType> {
  final Api _api;
  final _Box _box;

  FfiListCustomType._(this._api, this._box);

  @override
  Iterator<CustomType> get iterator => CustomIterator(this);

  @override
  int get length {
    return _api._ffiListCustomTypeLen(_box.borrow());
  }

  @override
  CustomType elementAt(int index) {
    final address = _api._ffiListCustomTypeElementAt(_box.borrow(), index);
    final reference =
        _Box(_api, ffi.Pointer.fromAddress(address), "drop_box_Leak");
    return CustomType._(_api, reference);
  }

  CustomType operator [](int index) {
    return elementAt(index);
  }

  void drop() {
    _box.drop();
  }
}
