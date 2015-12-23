set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 24.3623, <2> 20.6423, <3> 19.1419, <4> 20.2711, <5> 33.9498, <6> 23.9953, <7> 11.3045, <8> 19.4205, <9> 3.9358, <10> 28.752, <11> 5.1059, <12> 10.6453, <13> 26.3703, <14> 31.3883, <15> 29.1505, <16> 6.51, <17> 35.9465, <18> 2.7504, <19> 38.0234, <20> 39.3984;
param workload[JOB] := <1> 4.9358, <2> 4.5434, <3> 4.3751, <4> 4.5023, <5> 5.8266, <6> 4.8985, <7> 3.3622, <8> 4.4069, <9> 1.9839, <10> 5.3621, <11> 2.2596, <12> 3.2627, <13> 5.1352, <14> 5.6025, <15> 5.3991, <16> 2.5515, <17> 5.9955, <18> 1.6584, <19> 6.1663, <20> 6.2768;
param capacity[MACHINE] := <1> 88.5044, <2> 88.5044, <3> 88.5044, <4> 88.5044, <5> 88.5044, <6> 88.5044, <7> 88.5044;

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
