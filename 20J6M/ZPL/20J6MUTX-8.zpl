set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 13.1304, <2> 44.9408, <3> 28.9592, <4> 1.6028, <5> 47.2297, <6> 44.4794, <7> 42.8722, <8> 23.1818, <9> 6.7715, <10> 24.5301, <11> 8.4265, <12> 39.0463, <13> 40.3148, <14> 32.5018, <15> 49.7407, <16> 27.5283, <17> 31.7971, <18> 46.1786, <19> 43.7324, <20> 9.9253;
param workload[JOB] := <1> 3.6236, <2> 6.7038, <3> 5.3814, <4> 1.266, <5> 6.8724, <6> 6.6693, <7> 6.5477, <8> 4.8147, <9> 2.6022, <10> 4.9528, <11> 2.9028, <12> 6.2487, <13> 6.3494, <14> 5.701, <15> 7.0527, <16> 5.2467, <17> 5.6389, <18> 6.7955, <19> 6.613, <20> 3.1504;
param capacity[MACHINE] := <1> 13.1417, <2> 13.1417, <3> 13.1417, <4> 13.1417, <5> 13.1417, <6> 13.1417;

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
