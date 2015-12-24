set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 45.4074, <2> 26.7612, <3> 47.6799, <4> 45.1835, <5> 26.7949, <6> 24.8571, <7> 23.225, <8> 12.9613, <9> 25.6753, <10> 28.798;
param workload[JOB] := <1> 2061.832, <2> 716.1618, <3> 2273.3729, <4> 2041.5487, <5> 717.9667, <6> 617.8754, <7> 539.4006, <8> 167.9953, <9> 659.221, <10> 829.3248;
param capacity[MACHINE] := <1> 2656.1748, <2> 2656.1748, <3> 2656.1748;

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
