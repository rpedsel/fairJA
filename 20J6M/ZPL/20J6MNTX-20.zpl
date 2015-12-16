set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 27.2749, <2> 26.2527, <3> 22.7836, <4> 30.6492, <5> 27.1149, <6> 20.4857, <7> 15.7519, <8> 29.2392, <9> 25.5098, <10> 26.2617, <11> 23.1466, <12> 22.565, <13> 16.7879, <14> 23.8411, <15> 30.9885, <16> 20.9909, <17> 23.5224, <18> 26.9294, <19> 26.3134, <20> 25.1108;
param workload[JOB] := <1> 5.2225, <2> 5.1237, <3> 4.7732, <4> 5.5362, <5> 5.2072, <6> 4.5261, <7> 3.9689, <8> 5.4073, <9> 5.0507, <10> 5.1246, <11> 4.8111, <12> 4.7503, <13> 4.0973, <14> 4.8827, <15> 5.5667, <16> 4.5816, <17> 4.85, <18> 5.1894, <19> 5.1297, <20> 5.0111;
param capacity[MACHINE] := <1> 12.3513, <2> 12.3513, <3> 12.3513, <4> 12.3513, <5> 12.3513, <6> 12.3513;

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
