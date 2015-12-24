set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 40.6347, <2> 17.8188, <3> 28.8393, <4> 26.6836, <5> 35.1963, <6> 5.7203, <7> 40.9846, <8> 26.0254, <9> 27.8909, <10> 23.0692;
param workload[JOB] := <1> 6.3745, <2> 4.2212, <3> 5.3702, <4> 5.1656, <5> 5.9326, <6> 2.3917, <7> 6.4019, <8> 5.1015, <9> 5.2812, <10> 4.803;
param capacity[MACHINE] := <1> 17.0145, <2> 17.0145, <3> 17.0145;

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
