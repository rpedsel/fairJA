set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 32.1258, <2> 29.5218, <3> 23.6847, <4> 26.7976, <5> 25.3791, <6> 29.068, <7> 25.1939, <8> 25.5939, <9> 25.1803, <10> 23.0257;
param workload[JOB] := <1> 5.668, <2> 5.4334, <3> 4.8667, <4> 5.1766, <5> 5.0378, <6> 5.3915, <7> 5.0194, <8> 5.059, <9> 5.018, <10> 4.7985;
param capacity[MACHINE] := <1> 17.1563, <2> 17.1563, <3> 17.1563;

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
