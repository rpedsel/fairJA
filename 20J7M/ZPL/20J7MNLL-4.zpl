set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 19.7046, <2> 28.409, <3> 22.5163, <4> 24.994, <5> 23.503, <6> 21.4599, <7> 29.3505, <8> 26.8019, <9> 27.3093, <10> 30.1005, <11> 32.7761, <12> 24.2853, <13> 22.1278, <14> 25.0534, <15> 34.4901, <16> 20.7613, <17> 23.3765, <18> 24.509, <19> 36.0143, <20> 19.1483;
param workload[JOB] := <1> 19.7046, <2> 28.409, <3> 22.5163, <4> 24.994, <5> 23.503, <6> 21.4599, <7> 29.3505, <8> 26.8019, <9> 27.3093, <10> 30.1005, <11> 32.7761, <12> 24.2853, <13> 22.1278, <14> 25.0534, <15> 34.4901, <16> 20.7613, <17> 23.3765, <18> 24.509, <19> 36.0143, <20> 19.1483;
param capacity[MACHINE] := <1> 73.813, <2> 73.813, <3> 73.813, <4> 73.813, <5> 73.813, <6> 73.813, <7> 73.813;

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
