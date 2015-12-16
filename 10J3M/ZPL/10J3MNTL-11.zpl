set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 25.4818, <2> 27.5762, <3> 24.0976, <4> 24.8188, <5> 25.2241, <6> 33.164, <7> 20.6039, <8> 21.2311, <9> 18.9524, <10> 15.3162;
param workload[JOB] := <1> 25.4818, <2> 27.5762, <3> 24.0976, <4> 24.8188, <5> 25.2241, <6> 33.164, <7> 20.6039, <8> 21.2311, <9> 18.9524, <10> 15.3162;
param capacity[MACHINE] := <1> 59.1165, <2> 59.1165, <3> 59.1165;

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
