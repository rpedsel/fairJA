set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 37.0365, <2> 38.3438, <3> 14.62, <4> 30.4896, <5> 22.7394, <6> 23.2592, <7> 29.2614, <8> 25.4111, <9> 28.2405, <10> 27.9362;
param workload[JOB] := <1> 6.0858, <2> 6.1922, <3> 3.8236, <4> 5.5217, <5> 4.7686, <6> 4.8228, <7> 5.4094, <8> 5.0409, <9> 5.3142, <10> 5.2855;
param capacity[MACHINE] := <1> 52.2647, <2> 52.2647, <3> 52.2647;

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
