module q5 (
    input a,b,c,d, output w
);
    // wire ab,bb,cb,db;
    // assign ab = ~a;
    // assign bb = ~b;
    // assign cb = ~c;
    // assign db = ~d;
    assign w =
         ~a | ~b | ~c | ~d +
         ~a | b | ~c | ~d +
         a | ~b | ~c | ~d +
         a | ~b | ~c | d +
         ~a | b | ~c | d +
         a | b | ~c | d +
         ~a | ~b | c | d +
         ~a | ~b | c | ~d +
         ~a | b | c | ~d +
         a | b | c | ~d;

    
endmodule