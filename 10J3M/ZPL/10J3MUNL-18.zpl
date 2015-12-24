set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 0.3899, <2> 12.4292, <3> 24.5249, <4> 2.7998, <5> 36.3276, <6> 11.1071, <7> 3.0989, <8> 19.5574, <9> 1.8275, <10> 21.3392;
param workload[JOB] := <1> 0.3899, <2> 12.4292, <3> 24.5249, <4> 2.7998, <5> 36.3276, <6> 11.1071, <7> 3.0989, <8> 19.5574, <9> 1.8275, <10> 21.3392;
param capacity[MACHINE] := <1> 133.4015, <2> 133.4015, <3> 133.4015;

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
