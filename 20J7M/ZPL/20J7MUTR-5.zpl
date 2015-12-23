set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 15.9139, <2> 3.8427, <3> 9.952, <4> 10.3188, <5> 49.7645, <6> 9.0698, <7> 31.9476, <8> 36.564, <9> 25.0242, <10> 20.4274, <11> 38.3031, <12> 21.4191, <13> 47.0979, <14> 24.9955, <15> 22.538, <16> 0.3623, <17> 13.2183, <18> 17.779, <19> 34.3523, <20> 48.6694;
param workload[JOB] := <1> 46.8159, <2> 44.1818, <3> 43.8742, <4> 29.6542, <5> 41.5104, <6> 29.7196, <7> 6.3924, <8> 33.2663, <9> 31.1999, <10> 36.3496, <11> 7.7372, <12> 3.4743, <13> 1.5331, <14> 2.9783, <15> 30.3401, <16> 7.5395, <17> 37.2312, <18> 49.1171, <19> 30.4695, <20> 26.0087;
param capacity[MACHINE] := <1> 57.7922, <2> 57.7922, <3> 57.7922, <4> 57.7922, <5> 57.7922, <6> 57.7922, <7> 57.7922;

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
