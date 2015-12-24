set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 19.5692, <2> 8.6737, <3> 11.3999, <4> 0.8726, <5> 44.6619, <6> 11.2041, <7> 31.0645, <8> 10.3859, <9> 48.6483, <10> 6.1274;
param workload[JOB] := <1> 19.5692, <2> 8.6737, <3> 11.3999, <4> 0.8726, <5> 44.6619, <6> 11.2041, <7> 31.0645, <8> 10.3859, <9> 48.6483, <10> 6.1274;
param capacity[MACHINE] := <1> 53.3536, <2> 53.3536, <3> 53.3536;

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
