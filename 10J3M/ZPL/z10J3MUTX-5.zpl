set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 22.6757, <2> 6.7819, <3> 30.5717, <4> 2.4215, <5> 13.9175, <6> 34.7336, <7> 13.1913, <8> 7.3806, <9> 42.2286, <10> 47.3704;
param workload[JOB] := <1> 4.7619, <2> 2.6042, <3> 5.5292, <4> 1.5561, <5> 3.7306, <6> 5.8935, <7> 3.632, <8> 2.7167, <9> 6.4984, <10> 6.8826;
param capacity[MACHINE] := <1> 10.9513, <2> 10.9513, <3> 10.9513;

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
