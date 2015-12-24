set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 30.9346, <2> 15.5546, <3> 25.5864, <4> 11.7443, <5> 20.3117, <6> 39.891, <7> 43.2211, <8> 14.0185, <9> 18.9469, <10> 20.6964;
param workload[JOB] := <1> 30.1143, <2> 31.3643, <3> 25.7444, <4> 13.6168, <5> 34.0321, <6> 22.3691, <7> 24.4134, <8> 37.3018, <9> 42.644, <10> 49.0028;
param capacity[MACHINE] := <1> 310.603, <2> 310.603, <3> 310.603;

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
