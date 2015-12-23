set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 39.6083, <2> 35.0859, <3> 17.9564, <4> 10.8619, <5> 38.608, <6> 38.2549, <7> 25.352, <8> 44.7079, <9> 35.3884, <10> 3.2567, <11> 31.6101, <12> 42.1207, <13> 13.7743, <14> 5.3064, <15> 17.3368, <16> 12.9673, <17> 47.0791, <18> 13.2177, <19> 43.2669, <20> 17.5488;
param workload[JOB] := <1> 6.2935, <2> 5.9233, <3> 4.2375, <4> 3.2957, <5> 6.2135, <6> 6.1851, <7> 5.0351, <8> 6.6864, <9> 5.9488, <10> 1.8046, <11> 5.6223, <12> 6.49, <13> 3.7114, <14> 2.3036, <15> 4.1637, <16> 3.601, <17> 6.8614, <18> 3.6356, <19> 6.5778, <20> 4.1891;
param capacity[MACHINE] := <1> 10.5835, <2> 10.5835, <3> 10.5835, <4> 10.5835, <5> 10.5835, <6> 10.5835, <7> 10.5835;

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
