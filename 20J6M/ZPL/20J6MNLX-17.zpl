set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 20.308, <2> 28.4084, <3> 34.4552, <4> 27.33, <5> 26.6596, <6> 26.8365, <7> 30.3419, <8> 19.8981, <9> 31.0035, <10> 22.9378, <11> 27.3807, <12> 16.8445, <13> 27.8601, <14> 19.8675, <15> 31.685, <16> 27.6389, <17> 31.4485, <18> 22.3928, <19> 20.4834, <20> 25.2757;
param workload[JOB] := <1> 4.5064, <2> 5.33, <3> 5.8699, <4> 5.2278, <5> 5.1633, <6> 5.1804, <7> 5.5083, <8> 4.4607, <9> 5.5681, <10> 4.7893, <11> 5.2327, <12> 4.1042, <13> 5.2783, <14> 4.4573, <15> 5.6289, <16> 5.2573, <17> 5.6079, <18> 4.7321, <19> 4.5259, <20> 5.0275;
param capacity[MACHINE] := <1> 16.9094, <2> 16.9094, <3> 16.9094, <4> 16.9094, <5> 16.9094, <6> 16.9094;

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
