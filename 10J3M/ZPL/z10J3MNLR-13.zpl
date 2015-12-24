set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 18.2982, <2> 31.9056, <3> 28.8989, <4> 22.2994, <5> 10.4324, <6> 28.2633, <7> 29.1687, <8> 19.86, <9> 9.5325, <10> 30.0388;
param workload[JOB] := <1> 31.8294, <2> 34.4397, <3> 15.1116, <4> 32.2888, <5> 46.987, <6> 48.1787, <7> 13.6274, <8> 4.2472, <9> 5.3144, <10> 41.2864;
param capacity[MACHINE] := <1> 91.1035, <2> 91.1035, <3> 91.1035;

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
