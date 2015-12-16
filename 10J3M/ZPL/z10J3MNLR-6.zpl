set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 25.3408, <2> 22.8757, <3> 27.4895, <4> 21.7614, <5> 21.1648, <6> 33.6264, <7> 23.567, <8> 28.3648, <9> 26.8609, <10> 17.5611;
param workload[JOB] := <1> 3.7718, <2> 22.1163, <3> 0.9989, <4> 35.1613, <5> 13.9852, <6> 19.8286, <7> 34.3719, <8> 6.7804, <9> 16.6097, <10> 47.0007;
param capacity[MACHINE] := <1> 66.8749, <2> 66.8749, <3> 66.8749;

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
