set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 29.7272, <2> 19.3938, <3> 29.7916, <4> 26.7977, <5> 26.1817, <6> 21.3572, <7> 27.8806, <8> 25.2384, <9> 20.0461, <10> 21.0794, <11> 22.6513, <12> 28.2962, <13> 29.4456, <14> 21.7743, <15> 18.791, <16> 23.4429, <17> 34.5606, <18> 17.0727, <19> 28.7397, <20> 29.4491;
param workload[JOB] := <1> 5.4523, <2> 4.4038, <3> 5.4582, <4> 5.1766, <5> 5.1168, <6> 4.6214, <7> 5.2802, <8> 5.0238, <9> 4.4773, <10> 4.5912, <11> 4.7593, <12> 5.3194, <13> 5.4264, <14> 4.6663, <15> 4.3349, <16> 4.8418, <17> 5.8788, <18> 4.1319, <19> 5.3609, <20> 5.4267;
param capacity[MACHINE] := <1> 99.748, <2> 99.748, <3> 99.748, <4> 99.748, <5> 99.748, <6> 99.748;

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
