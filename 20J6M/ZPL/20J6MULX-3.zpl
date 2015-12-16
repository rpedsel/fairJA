set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 28.9186, <2> 25.064, <3> 9.6342, <4> 0.6983, <5> 6.4397, <6> 32.4296, <7> 2.272, <8> 3.853, <9> 41.7248, <10> 19.4297, <11> 39.4975, <12> 7.8342, <13> 13.5424, <14> 35.8955, <15> 44.8921, <16> 25.3491, <17> 3.9063, <18> 10.2632, <19> 12.4129, <20> 42.327;
param workload[JOB] := <1> 5.3776, <2> 5.0064, <3> 3.1039, <4> 0.8356, <5> 2.5377, <6> 5.6947, <7> 1.5073, <8> 1.9629, <9> 6.4595, <10> 4.4079, <11> 6.2847, <12> 2.799, <13> 3.68, <14> 5.9913, <15> 6.7002, <16> 5.0348, <17> 1.9764, <18> 3.2036, <19> 3.5232, <20> 6.5059;
param capacity[MACHINE] := <1> 13.7654, <2> 13.7654, <3> 13.7654, <4> 13.7654, <5> 13.7654, <6> 13.7654;

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
