set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 21.346, <2> 29.386, <3> 24.0816, <4> 23.2553, <5> 27.7566, <6> 31.0364, <7> 15.9912, <8> 36.6494, <9> 32.5221, <10> 21.0946;
param workload[JOB] := <1> 4.6202, <2> 5.4209, <3> 4.9073, <4> 4.8224, <5> 5.2685, <6> 5.571, <7> 3.9989, <8> 6.0539, <9> 5.7028, <10> 4.5929;
param capacity[MACHINE] := <1> 16.9863, <2> 16.9863, <3> 16.9863;

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
