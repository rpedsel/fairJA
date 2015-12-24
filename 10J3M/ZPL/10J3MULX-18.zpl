set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 43.9597, <2> 16.6075, <3> 28.352, <4> 23.0987, <5> 40.7142, <6> 26.7943, <7> 10.2879, <8> 49.278, <9> 3.3915, <10> 28.9741;
param workload[JOB] := <1> 6.6302, <2> 4.0752, <3> 5.3247, <4> 4.8061, <5> 6.3808, <6> 5.1763, <7> 3.2075, <8> 7.0198, <9> 1.8416, <10> 5.3828;
param capacity[MACHINE] := <1> 16.615, <2> 16.615, <3> 16.615;

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
