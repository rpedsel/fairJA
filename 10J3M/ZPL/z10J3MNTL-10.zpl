set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 34.3363, <2> 18.9912, <3> 19.046, <4> 18.2955, <5> 21.8835, <6> 26.5967, <7> 25.1759, <8> 34.3931, <9> 30.2433, <10> 27.0544;
param workload[JOB] := <1> 34.3363, <2> 18.9912, <3> 19.046, <4> 18.2955, <5> 21.8835, <6> 26.5967, <7> 25.1759, <8> 34.3931, <9> 30.2433, <10> 27.0544;
param capacity[MACHINE] := <1> 64.004, <2> 64.004, <3> 64.004;

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
