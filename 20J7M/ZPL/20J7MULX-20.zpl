set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 9.2126, <2> 47.006, <3> 0.0859, <4> 19.9787, <5> 23.948, <6> 49.3982, <7> 35.9105, <8> 4.4351, <9> 49.4865, <10> 24.0765, <11> 4.3881, <12> 44.4284, <13> 3.421, <14> 37.2245, <15> 21.1446, <16> 10.2467, <17> 8.3746, <18> 45.6446, <19> 39.748, <20> 29.0137;
param workload[JOB] := <1> 3.0352, <2> 6.8561, <3> 0.2931, <4> 4.4698, <5> 4.8937, <6> 7.0284, <7> 5.9925, <8> 2.106, <9> 7.0347, <10> 4.9068, <11> 2.0948, <12> 6.6655, <13> 1.8496, <14> 6.1012, <15> 4.5983, <16> 3.201, <17> 2.8939, <18> 6.7561, <19> 6.3046, <20> 5.3864;
param capacity[MACHINE] := <1> 13.2097, <2> 13.2097, <3> 13.2097, <4> 13.2097, <5> 13.2097, <6> 13.2097, <7> 13.2097;

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
