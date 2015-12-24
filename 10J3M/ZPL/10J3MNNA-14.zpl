set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 20.42, <2> 25.9642, <3> 31.6065, <4> 27.4312, <5> 25.1126, <6> 14.5963, <7> 29.0726, <8> 23.5178, <9> 22.6935, <10> 25.9527;
param workload[JOB] := <1> 416.9764, <2> 674.1397, <3> 998.9708, <4> 752.4707, <5> 630.6427, <6> 213.052, <7> 845.2161, <8> 553.0869, <9> 514.9949, <10> 673.5426;
param capacity[MACHINE] := <1> 6273.0928, <2> 6273.0928, <3> 6273.0928;

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
