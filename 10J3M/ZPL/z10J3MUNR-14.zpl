set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 19.7079, <2> 44.8692, <3> 29.7045, <4> 0.3014, <5> 2.778, <6> 11.4529, <7> 30.0095, <8> 23.1994, <9> 2.9547, <10> 31.3911;
param workload[JOB] := <1> 24.0843, <2> 16.481, <3> 18.8499, <4> 31.1595, <5> 32.1344, <6> 49.3403, <7> 1.1696, <8> 17.7002, <9> 49.4728, <10> 20.4918;
param capacity[MACHINE] := <1> 260.8838, <2> 260.8838, <3> 260.8838;

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
