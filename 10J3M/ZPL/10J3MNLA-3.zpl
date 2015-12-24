set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 25.0827, <2> 16.8093, <3> 25.0555, <4> 24.4591, <5> 20.7739, <6> 25.0386, <7> 26.1275, <8> 30.2912, <9> 21.7592, <10> 33.5239;
param workload[JOB] := <1> 629.1418, <2> 282.5526, <3> 627.7781, <4> 598.2476, <5> 431.5549, <6> 626.9315, <7> 682.6463, <8> 917.5568, <9> 473.4628, <10> 1123.8519;
param capacity[MACHINE] := <1> 2131.2414, <2> 2131.2414, <3> 2131.2414;

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
