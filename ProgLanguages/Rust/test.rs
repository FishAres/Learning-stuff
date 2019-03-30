fn main() {
    let x: i32 = 1; // immutable bindings
    let implicit_x = 1; // type inference

    let mut mutable = 1;
    mutable = 4;
    mutable += 2;

    fn add2(x:i32, y:i32) -> i32 {
        x + y
    }
    
    println!("{}", add2(x,mutable));

    let s: String = "hello world".to_string();
    println!("{}", s)
}