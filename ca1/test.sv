module My_OC(input a,b,c, output w);

    supply1 vdd;
    supply0 gnd;

    wire t1,t2,t3,t4,r1,r2,i,j,k;
    pmos #(5,6,7) p1(t1,vdd,~a),
                  p2(t2,vdd,a),
                  p3(t3,vdd,~a),
                  p4(t4,vdd,a),
                  p5(r1,t1,b),
                  p6(r1,t2,~b),
                  p7(r2,t3,~b),
                  p8(r2,t4,b),
                  p9(w,r1,~c),
                  p10(w,r2,c);

    nmos #(3,4,5) n1(i,gnd,b),
                  n2(i,gnd,a),
                  n3(j,i,~b),
                  n4(j,i,~a),
                  n5(j,gnd,c),
                  n6(k,j,b),
                  n7(k,j,~a),
                  n8(w,k,~b),
                  n9(w,k,a),
                  n10(w,j,~c);
    
endmodule