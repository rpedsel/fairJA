set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 45.6195, <2> 32.7752, <3> 21.9721, <4> 10.4476, <5> 27.2464, <6> 47.4232, <7> 9.6486, <8> 11.0045, <9> 37.3771, <10> 23.3169;
param workload[JOB] := <1> 41.6725, <2> 36.9345, <3> 43.5631, <4> 24.8924, <5> 23.0251, <6> 30.1835, <7> 46.9868, <8> 8.591, <9> 4.6733, <10> 39.7272;
param capacity[MACHINE] := <1> 100.0831, <2> 100.0831, <3> 100.0831;

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
