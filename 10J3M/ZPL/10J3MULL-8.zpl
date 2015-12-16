set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 32.9729, <2> 22.2416, <3> 9.2803, <4> 31.8946, <5> 11.9779, <6> 13.8812, <7> 33.7992, <8> 5.4705, <9> 49.7997, <10> 34.5985;
param workload[JOB] := <1> 32.9729, <2> 22.2416, <3> 9.2803, <4> 31.8946, <5> 11.9779, <6> 13.8812, <7> 33.7992, <8> 5.4705, <9> 49.7997, <10> 34.5985;
param capacity[MACHINE] := <1> 81.9721, <2> 81.9721, <3> 81.9721;

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
