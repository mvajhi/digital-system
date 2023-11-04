# test bench transfer delay
## usage
***run in terminal:***
```
python3 main.py
```

***enter input (example 2 and 100):***
```
how many logic var do you have? 2
How long to wait between each transformations (sleep time)? 100
```

***get output:***
```
{'count': 2, 'sleep_time': 100}
list of logic:  ['00', '01', '10', '11']
transformations list:  ['00', '01', '00', '10', '00', '11', '00', '01', '10', '01', '11', '01', '10', '11', '10', '11']

verilog code:

logic __00__, __01__;
initial begin
        #100 __00__ = 0; __01__ = 0;
        #100 __00__ = 0; __01__ = 1;
        #100 __00__ = 0; __01__ = 0;
        #100 __00__ = 1; __01__ = 0;
        #100 __00__ = 0; __01__ = 0;
        #100 __00__ = 1; __01__ = 1;
        #100 __00__ = 0; __01__ = 0;
        #100 __00__ = 0; __01__ = 1;
        #100 __00__ = 1; __01__ = 0;
        #100 __00__ = 0; __01__ = 1;
        #100 __00__ = 1; __01__ = 1;
        #100 __00__ = 0; __01__ = 1;
        #100 __00__ = 1; __01__ = 0;
        #100 __00__ = 1; __01__ = 1;
        #100 __00__ = 1; __01__ = 0;
        #100 __00__ = 1; __01__ = 1;
        #100 $stop;
end

```

***use and enjoy :)***

***for 2input-nand gate:***
![tb](https://github.com/mvajhi/digital-system/assets/109323483/296e83c8-ffac-47c6-beab-221bf94e0dd0)

***for 3input-aoi gate:***
![tb2](https://github.com/mvajhi/digital-system/assets/109323483/b5b7c2ff-a303-465b-9c09-c46a9adc5703)
