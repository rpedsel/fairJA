set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 8.589, <2> 44.6955, <3> 35.6782, <4> 20.6346, <5> 31.7832, <6> 6.6034, <7> 6.3851, <8> 12.9069, <9> 4.4718, <10> 12.9726, <11> 15.2233, <12> 13.1536, <13> 38.6452, <14> 11.5604, <15> 43.2802, <16> 4.9954, <17> 16.0739, <18> 9.3794, <19> 44.9738, <20> 17.8285;
param workload[JOB] := <1> 2.9307, <2> 6.6855, <3> 5.9731, <4> 4.5425, <5> 5.6377, <6> 2.5697, <7> 2.5269, <8> 3.5926, <9> 2.1147, <10> 3.6017, <11> 3.9017, <12> 3.6268, <13> 6.2165, <14> 3.4001, <15> 6.5788, <16> 2.235, <17> 4.0092, <18> 3.0626, <19> 6.7063, <20> 4.2224;
param capacity[MACHINE] := <1> 9.0144, <2> 9.0144, <3> 9.0144, <4> 9.0144, <5> 9.0144, <6> 9.0144, <7> 9.0144;

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
