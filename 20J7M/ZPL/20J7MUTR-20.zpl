set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 47.5186, <2> 3.4148, <3> 3.0177, <4> 37.1295, <5> 46.6083, <6> 7.001, <7> 16.4207, <8> 37.3907, <9> 5.3423, <10> 20.4481, <11> 40.6455, <12> 2.3282, <13> 32.6844, <14> 9.6392, <15> 33.9837, <16> 3.4475, <17> 17.764, <18> 6.7847, <19> 40.2551, <20> 33.3497;
param workload[JOB] := <1> 46.609, <2> 44.6339, <3> 29.952, <4> 27.5954, <5> 23.962, <6> 40.8975, <7> 38.3333, <8> 21.3655, <9> 30.7422, <10> 10.2784, <11> 30.4241, <12> 20.7869, <13> 7.1076, <14> 40.1556, <15> 37.6106, <16> 48.6562, <17> 31.131, <18> 17.3265, <19> 35.6146, <20> 24.8339;
param capacity[MACHINE] := <1> 65.1446, <2> 65.1446, <3> 65.1446, <4> 65.1446, <5> 65.1446, <6> 65.1446, <7> 65.1446;

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
