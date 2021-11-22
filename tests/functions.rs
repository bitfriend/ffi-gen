use ffi_gen::compile_pass;

compile_pass! {
    no_args_no_ret,
    "hello_world fn();",
    ( pub fn hello_world() {} ),
    ( __hello_world(); ),
    ( api.hello_world(); ),
    ( api.hello_world(); ),
}

compile_pass! {
    no_args_ret_u8,
    "hello_world fn() -> u8;",
    (
        pub fn hello_world() -> u8 {
            42
        }
    ),
    ( assert_eq!(__hello_world(), 42); ),
    ( assert(api.hello_world() == 42); ),
    ( assert.equal(api.hello_world(), 42); ),
}

compile_pass! {
    args_u8_ret_u8,
    "hello_world fn(arg: u8) -> u8;",
    (
        pub fn hello_world(arg: u8) -> u8 {
            arg
        }
    ),
    ( assert_eq!(__hello_world(42), 42); ),
    ( assert(api.hello_world(42) == 42); ),
    ( assert.equal(api.hello_world(42), 42); ),
}

compile_pass! {
    args_bool_ret_bool,
    "hello_world fn(arg: bool) -> bool;",
    (
        pub fn hello_world(arg: bool) -> bool {
            arg
        }
    ),
    ( assert_eq!(__hello_world(true), true); ),
    ( assert(api.hello_world(true) == true); ),
    ( assert.equal(api.hello_world(true), true); ),
}

compile_pass! {
    args_usize_ret_usize,
    "hello_world fn(arg: usize) -> usize;",
    (
        pub fn hello_world(arg: usize) -> usize {
            arg
        }
    ),
    ( assert_eq!(__hello_world(42), 42); ),
    ( assert(api.hello_world(42) == 42); ),
    ( assert.equal(api.hello_world(42), 42); ),
}

compile_pass! {
    args_f64_ret_f64,
    "hello_world fn(arg: f64) -> f64;",
    (
        pub fn hello_world(arg: f64) -> f64 {
            arg
        }
    ),
    ( assert_eq!(__hello_world(42.24), 42.24); ),
    ( assert(api.hello_world(42.24) == 42.24); ),
    ( assert.equal(api.hello_world(42.24), 42.24); ),
}

compile_pass! {
    args_str_ret_usize,
    "strlen fn(arg: &string) -> usize;",
    (
        pub fn strlen(s: &str) -> usize {
            s.len()
        }
    ),
    (
        let s = "hello world";
        assert_eq!(__strlen(s.as_ptr() as _, s.len() as _), 11);
    ),
    ( assert(api.strlen("hello world") == 11); ),
    ( assert.equal(api.strlen("hello world"), 11); ),
}

compile_pass! {
    args_string_ret_usize,
    "strlen fn(arg: string) -> usize;",
    (
        pub fn strlen(s: String) -> usize {
            s.len()
        }
    ),
    (
        use core::mem::ManuallyDrop;
        let s = ManuallyDrop::new("hello world".to_string());
        assert_eq!(__strlen(s.as_ptr() as _, s.len() as _, s.capacity() as _), 11);
    ),
    ( assert(api.strlen("hello world") == 11); ),
    ( assert.equal(api.strlen("hello world"), 11); ),
}

compile_pass! {
    no_args_ret_string,
    "make_string fn() -> string;",
    (
        pub fn make_string() -> String {
            "hello world".to_string()
        }
    ),
    (
        let ret = __make_string();
        let s = unsafe { String::from_raw_parts(ret.ptr as _, ret.len as _, ret.cap as _) };
        assert_eq!(s.as_str(), "hello world");
    ),
    ( assert(api.make_string() == "hello world"); ),
    ( assert.equal(api.make_string(), "hello world"); ),
}

compile_pass! {
    args_str_ret_str,
    "as_str fn(s: &string) -> &string;",
    (
        pub fn as_str<'a>(s: &'a str) -> &'a str {
            s
        }
    ),
    (
        let s = "hello world";
        let ret = __as_str(s.as_ptr() as _, s.len() as _);
        let slice = unsafe { core::slice::from_raw_parts(ret.ptr as _, ret.len as _) };
        let s2 = unsafe { std::str::from_utf8_unchecked(slice) };
        assert_eq!(s, s2);
    ),
    ( assert(api.as_str("hello world") == "hello world"); ),
    ( assert.equal(api.as_str("hello world"), "hello world"); ),
}

compile_pass! {
    args_slice_u8_ret_vec_u8,
    "to_vec fn(b: &[u8]) -> Vec<u8>;",
    (
        pub fn to_vec(b: &[u8]) -> Vec<u8> {
            b.to_vec()
        }
    ),
    ( ),
    (
        assert(api.to_vec([]).equals([]));
        assert(api.to_vec([0, 1, 2, 3, 4]).equals([0, 1, 2, 3, 4]));
    ),
    (
        assert.deepEqual(api.to_vec([]), []);
        assert.deepEqual(api.to_vec([0, 1, 2, 3, 4]), [0, 1, 2, 3, 4]);
    ),
}

compile_pass! {
    args_slice_u64_ret_vec_u64,
    "to_vec fn(b: &[u64]) -> Vec<u64>;",
    (
        pub fn to_vec(b: &[u64]) -> Vec<u64> {
            b.to_vec()
        }
    ),
    ( ),
    (
        assert(api.to_vec([]).equals([]));
        assert(api.to_vec([0, 1, 2, 3, 4]).equals([0, 1, 2, 3, 4]));
    ),
    (
        assert.deepEqual(api.to_vec([]), []);
        assert.deepEqual(api.to_vec([0n, 1n, 2n, 3n, 4n]), [0n, 1n, 2n, 3n, 4n]);
    ),
}

compile_pass! {
    args_vec_isize_ret_vec_isize,
    "reverse fn(b: Vec<isize>) -> Vec<isize>;",
    (
        pub fn reverse(b: Vec<isize>) -> Vec<isize> {
            b.into_iter().rev().collect()
        }
    ),
    ( ),
    (
        assert(api.reverse([]).equals([]));
        assert(api.reverse([0, 1, 2, 3, 4]).equals([4, 3, 2, 1, 0]));
    ),
    (
        assert.deepEqual(api.reverse([]), []);
        assert.deepEqual(api.reverse([0, 1, 2, 3, 4]), [4, 3, 2, 1, 0]);
    ),
}