set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 22.2072, <2> 29.2547, <3> 24.9953, <4> 25.934, <5> 26.4363, <6> 21.7849, <7> 28.9947, <8> 24.4032, <9> 12.1133, <10> 22.7185, <11> 15.8012, <12> 21.7406, <13> 25.3505, <14> 28.0899, <15> 21.2682, <16> 26.4443, <17> 27.1376, <18> 20.9683, <19> 17.7837, <20> 25.3149;
param workload[JOB] := <1> 4.7125, <2> 5.4088, <3> 4.9995, <4> 5.0925, <5> 5.1416, <6> 4.6674, <7> 5.3847, <8> 4.94, <9> 3.4804, <10> 4.7664, <11> 3.9751, <12> 4.6627, <13> 5.0349, <14> 5.3, <15> 4.6117, <16> 5.1424, <17> 5.2094, <18> 4.5791, <19> 4.2171, <20> 5.0314;
param capacity[MACHINE] := <1> 96.3576, <2> 96.3576, <3> 96.3576, <4> 96.3576, <5> 96.3576, <6> 96.3576;

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
