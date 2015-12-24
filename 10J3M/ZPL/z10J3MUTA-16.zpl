set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 6.326, <2> 46.8029, <3> 12.9832, <4> 11.852, <5> 45.7815, <6> 35.4956, <7> 37.7261, <8> 10.8919, <9> 42.2954, <10> 7.0896;
param workload[JOB] := <1> 40.0183, <2> 2190.5114, <3> 168.5635, <4> 140.4699, <5> 2095.9457, <6> 1259.9376, <7> 1423.2586, <8> 118.6335, <9> 1788.9009, <10> 50.2624;
param capacity[MACHINE] := <1> 2319.1255, <2> 2319.1255, <3> 2319.1255;

var x[JM] binary;
var z;
maximize minBenefit: z;
subto Z:
   forall <m> in MACHINE do
      sum <j> in JOB : benefit[j] * x[j,m] >= z;
subto K:
   forall <m> in MACHINE do
      sum <j> in JOB : workload[j] * x[j,m] <= capacity[m];
subto X:
   forall <j> in JOB do
      sum <m> in MACHINE : x[j,m] <= 1;
subto A:
   forall <j,m> in JM do
      x[j,m] >= 0;
