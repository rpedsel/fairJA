set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 15.3374, <2> 44.088, <3> 30.7537, <4> 41.4164, <5> 13.2683, <6> 45.9488, <7> 21.6156, <8> 25.0407, <9> 47.2002, <10> 46.5461, <11> 29.2971, <12> 26.6182, <13> 23.0467, <14> 0.9754, <15> 39.3942, <16> 14.9528, <17> 10.7216, <18> 39.878, <19> 19.3451, <20> 20.0735;
param workload[JOB] := <1> 21.9718, <2> 17.8823, <3> 49.4883, <4> 48.8681, <5> 47.1938, <6> 19.3273, <7> 21.5451, <8> 32.9356, <9> 40.9268, <10> 22.1847, <11> 25.9579, <12> 1.3926, <13> 30.4387, <14> 46.9473, <15> 28.5675, <16> 49.2374, <17> 21.9583, <18> 18.5007, <19> 18.6424, <20> 19.8942;
param capacity[MACHINE] := <1> 62.5565, <2> 62.5565, <3> 62.5565, <4> 62.5565, <5> 62.5565, <6> 62.5565, <7> 62.5565;

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
