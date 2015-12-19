set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 24.8021, <2> 10.0482, <3> 1.9365, <4> 44.0217, <5> 45.3515, <6> 17.0107, <7> 26.0709, <8> 28.5638, <9> 8.7271, <10> 27.3995;
param workload[JOB] := <1> 12.8787, <2> 29.1084, <3> 12.075, <4> 34.5334, <5> 28.5605, <6> 19.5752, <7> 32.4522, <8> 22.0562, <9> 45.6384, <10> 21.9901;
param capacity[MACHINE] := <1> 258.8681, <2> 258.8681, <3> 258.8681;

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
