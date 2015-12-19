set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 20.4435, <2> 23.0986, <3> 28.8308, <4> 26.6719, <5> 29.7181, <6> 21.6653, <7> 24.848, <8> 21.5092, <9> 25.3016, <10> 24.442;
param workload[JOB] := <1> 417.9367, <2> 533.5453, <3> 831.215, <4> 711.3902, <5> 883.1655, <6> 469.3852, <7> 617.4231, <8> 462.6457, <9> 640.171, <10> 597.4114;
param capacity[MACHINE] := <1> 6164.2891, <2> 6164.2891, <3> 6164.2891;

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
