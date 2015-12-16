set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 26.6266, <2> 26.462, <3> 20.7287, <4> 26.9794, <5> 29.0807, <6> 24.653, <7> 23.3689, <8> 19.2841, <9> 30.9798, <10> 29.2406;
param workload[JOB] := <1> 5.1601, <2> 5.1441, <3> 4.5529, <4> 5.1942, <5> 5.3927, <6> 4.9652, <7> 4.8341, <8> 4.3914, <9> 5.566, <10> 5.4075;
param capacity[MACHINE] := <1> 50.6082, <2> 50.6082, <3> 50.6082;

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
