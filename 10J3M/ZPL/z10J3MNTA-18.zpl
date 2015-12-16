set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 23.6158, <2> 31.78, <3> 16.2353, <4> 28.233, <5> 27.6564, <6> 28.8601, <7> 25.4065, <8> 33.655, <9> 9.1102, <10> 30.2645;
param workload[JOB] := <1> 557.706, <2> 1009.9684, <3> 263.585, <4> 797.1023, <5> 764.8765, <6> 832.9054, <7> 645.4902, <8> 1132.659, <9> 82.9957, <10> 915.94;
param capacity[MACHINE] := <1> 1750.8071, <2> 1750.8071, <3> 1750.8071;

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
