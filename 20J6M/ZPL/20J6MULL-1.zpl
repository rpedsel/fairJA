set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 27.6748, <2> 47.128, <3> 11.523, <4> 17.6209, <5> 28.4665, <6> 4.4535, <7> 48.9191, <8> 34.0737, <9> 39.8834, <10> 32.4061, <11> 20.5138, <12> 49.9719, <13> 3.5339, <14> 3.0654, <15> 29.2662, <16> 32.5817, <17> 14.8949, <18> 1.2738, <19> 40.5161, <20> 8.761;
param workload[JOB] := <1> 27.6748, <2> 47.128, <3> 11.523, <4> 17.6209, <5> 28.4665, <6> 4.4535, <7> 48.9191, <8> 34.0737, <9> 39.8834, <10> 32.4061, <11> 20.5138, <12> 49.9719, <13> 3.5339, <14> 3.0654, <15> 29.2662, <16> 32.5817, <17> 14.8949, <18> 1.2738, <19> 40.5161, <20> 8.761;
param capacity[MACHINE] := <1> 82.7546, <2> 82.7546, <3> 82.7546, <4> 82.7546, <5> 82.7546, <6> 82.7546;

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
