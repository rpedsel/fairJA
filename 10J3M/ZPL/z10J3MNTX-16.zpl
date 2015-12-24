set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 30.3622, <2> 15.7161, <3> 29.7243, <4> 28.4765, <5> 13.966, <6> 25.154, <7> 24.6023, <8> 26.802, <9> 32.4049, <10> 31.3074;
param workload[JOB] := <1> 5.5102, <2> 3.9644, <3> 5.452, <4> 5.3363, <5> 3.7371, <6> 5.0154, <7> 4.9601, <8> 5.1771, <9> 5.6925, <10> 5.5953;
param capacity[MACHINE] := <1> 12.6101, <2> 12.6101, <3> 12.6101;

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
