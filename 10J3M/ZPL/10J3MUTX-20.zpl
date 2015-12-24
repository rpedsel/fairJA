set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 19.7307, <2> 34.9939, <3> 38.2139, <4> 25.4632, <5> 43.7023, <6> 46.785, <7> 5.154, <8> 23.7002, <9> 43.883, <10> 32.8243;
param workload[JOB] := <1> 4.4419, <2> 5.9156, <3> 6.1817, <4> 5.0461, <5> 6.6108, <6> 6.84, <7> 2.2702, <8> 4.8683, <9> 6.6244, <10> 5.7292;
param capacity[MACHINE] := <1> 13.6321, <2> 13.6321, <3> 13.6321;

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
