set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 17.128, <2> 19.3125, <3> 26.7993, <4> 21.1138, <5> 11.2214, <6> 13.2545, <7> 20.2614, <8> 23.4807, <9> 19.647, <10> 25.3613, <11> 20.6024, <12> 22.3263, <13> 19.3435, <14> 26.5394, <15> 15.5086, <16> 18.4701, <17> 31.2672, <18> 29.1275, <19> 26.7694, <20> 27.3418;
param workload[JOB] := <1> 4.1386, <2> 4.3946, <3> 5.1768, <4> 4.595, <5> 3.3498, <6> 3.6407, <7> 4.5013, <8> 4.8457, <9> 4.4325, <10> 5.036, <11> 4.539, <12> 4.7251, <13> 4.3981, <14> 5.1516, <15> 3.9381, <16> 4.2977, <17> 5.5917, <18> 5.397, <19> 5.1739, <20> 5.2289;
param capacity[MACHINE] := <1> 13.2217, <2> 13.2217, <3> 13.2217, <4> 13.2217, <5> 13.2217, <6> 13.2217, <7> 13.2217;

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
