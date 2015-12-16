set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 26.943, <2> 29.6676, <3> 27.0197, <4> 39.7133, <5> 20.8233, <6> 17.1031, <7> 24.6135, <8> 15.665, <9> 22.5032, <10> 14.9641, <11> 19.9765, <12> 25.0096, <13> 24.8016, <14> 28.4569, <15> 20.2076, <16> 17.284, <17> 23.1893, <18> 27.2368, <19> 22.83, <20> 25.2511;
param workload[JOB] := <1> 13.6948, <2> 6.9608, <3> 4.5855, <4> 43.7033, <5> 42.0984, <6> 20.9607, <7> 1.3185, <8> 28.9747, <9> 1.4184, <10> 29.0248, <11> 1.0862, <12> 49.2373, <13> 18.1708, <14> 17.1653, <15> 7.947, <16> 39.9227, <17> 8.8509, <18> 42.3887, <19> 31.6796, <20> 7.1563;
param capacity[MACHINE] := <1> 69.3908, <2> 69.3908, <3> 69.3908, <4> 69.3908, <5> 69.3908, <6> 69.3908;

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
