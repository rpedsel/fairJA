set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 38.0733, <2> 24.4137, <3> 19.5924, <4> 18.7739, <5> 18.7143, <6> 23.6972, <7> 25.844, <8> 26.7765, <9> 21.1738, <10> 26.3796;
param workload[JOB] := <1> 9.8327, <2> 20.297, <3> 25.1889, <4> 20.6345, <5> 17.0738, <6> 47.7793, <7> 18.3681, <8> 7.2368, <9> 17.4728, <10> 20.3917;
param capacity[MACHINE] := <1> 68.0919, <2> 68.0919, <3> 68.0919;

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
