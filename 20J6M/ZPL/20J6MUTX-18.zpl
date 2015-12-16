set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 28.8483, <2> 7.3759, <3> 22.4387, <4> 40.8417, <5> 24.6587, <6> 41.4485, <7> 23.3398, <8> 34.429, <9> 16.0587, <10> 22.3458, <11> 2.6971, <12> 44.0943, <13> 48.3107, <14> 48.1034, <15> 22.7446, <16> 7.8121, <17> 31.7328, <18> 42.7714, <19> 30.4959, <20> 32.2405;
param workload[JOB] := <1> 5.3711, <2> 2.7159, <3> 4.737, <4> 6.3908, <5> 4.9658, <6> 6.4381, <7> 4.8311, <8> 5.8676, <9> 4.0073, <10> 4.7271, <11> 1.6423, <12> 6.6404, <13> 6.9506, <14> 6.9357, <15> 4.7691, <16> 2.795, <17> 5.6332, <18> 6.54, <19> 5.5223, <20> 5.6781;
param capacity[MACHINE] := <1> 12.8948, <2> 12.8948, <3> 12.8948, <4> 12.8948, <5> 12.8948, <6> 12.8948;

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
