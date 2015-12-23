set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 36.224, <2> 20.9348, <3> 3.021, <4> 32.5606, <5> 30.9439, <6> 19.5785, <7> 18.4849, <8> 36.6472, <9> 29.0542, <10> 8.9184, <11> 18.2943, <12> 34.0183, <13> 40.987, <14> 0.8705, <15> 25.9167, <16> 18.8751, <17> 47.8094, <18> 44.0699, <19> 39.248, <20> 25.471;
param workload[JOB] := <1> 6.0186, <2> 4.5755, <3> 1.7381, <4> 5.7062, <5> 5.5627, <6> 4.4248, <7> 4.2994, <8> 6.0537, <9> 5.3902, <10> 2.9864, <11> 4.2772, <12> 5.8325, <13> 6.4021, <14> 0.933, <15> 5.0908, <16> 4.3445, <17> 6.9144, <18> 6.6385, <19> 6.2648, <20> 5.0469;
param capacity[MACHINE] := <1> 14.0715, <2> 14.0715, <3> 14.0715, <4> 14.0715, <5> 14.0715, <6> 14.0715, <7> 14.0715;

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
