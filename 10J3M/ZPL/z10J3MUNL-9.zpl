set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 16.7423, <2> 22.3619, <3> 37.2257, <4> 45.1255, <5> 21.3266, <6> 9.5699, <7> 22.4088, <8> 32.1717, <9> 32.3041, <10> 7.0803;
param workload[JOB] := <1> 16.7423, <2> 22.3619, <3> 37.2257, <4> 45.1255, <5> 21.3266, <6> 9.5699, <7> 22.4088, <8> 32.1717, <9> 32.3041, <10> 7.0803;
param capacity[MACHINE] := <1> 246.3168, <2> 246.3168, <3> 246.3168;

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
