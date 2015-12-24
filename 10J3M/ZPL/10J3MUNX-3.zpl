set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 15.7487, <2> 30.9516, <3> 37.7526, <4> 7.2503, <5> 10.9998, <6> 45.3757, <7> 17.0622, <8> 48.3716, <9> 28.3959, <10> 48.1855;
param workload[JOB] := <1> 3.9685, <2> 5.5634, <3> 6.1443, <4> 2.6926, <5> 3.3166, <6> 6.7361, <7> 4.1306, <8> 6.955, <9> 5.3288, <10> 6.9416;
param capacity[MACHINE] := <1> 51.7775, <2> 51.7775, <3> 51.7775;

var x[JM];
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
