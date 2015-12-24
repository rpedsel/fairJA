set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 49.4841, <2> 31.8198, <3> 4.2646, <4> 23.0487, <5> 17.7974, <6> 0.4548, <7> 28.5487, <8> 45.6476, <9> 21.3424, <10> 26.6209, <11> 41.3496, <12> 0.4899, <13> 44.4824, <14> 17.4672, <15> 49.6433, <16> 6.0271, <17> 41.741, <18> 26.3468, <19> 0.9325, <20> 18.044;
param workload[JOB] := <1> 7.0345, <2> 5.6409, <3> 2.0651, <4> 4.8009, <5> 4.2187, <6> 0.6744, <7> 5.3431, <8> 6.7563, <9> 4.6198, <10> 5.1595, <11> 6.4304, <12> 0.6999, <13> 6.6695, <14> 4.1794, <15> 7.0458, <16> 2.455, <17> 6.4607, <18> 5.1329, <19> 0.9657, <20> 4.2478;
param capacity[MACHINE] := <1> 9.7072, <2> 9.7072, <3> 9.7072, <4> 9.7072, <5> 9.7072, <6> 9.7072, <7> 9.7072;

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
