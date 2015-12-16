set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 21.0959, <2> 31.6193, <3> 27.5899, <4> 25.2673, <5> 28.3004, <6> 35.3189, <7> 28.781, <8> 24.7489, <9> 35.631, <10> 21.4037;
param workload[JOB] := <1> 0.5241, <2> 44.3707, <3> 21.0949, <4> 36.9569, <5> 7.6786, <6> 25.6686, <7> 48.2156, <8> 28.4309, <9> 22.7231, <10> 16.0608;
param capacity[MACHINE] := <1> 251.7242, <2> 251.7242, <3> 251.7242;

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
