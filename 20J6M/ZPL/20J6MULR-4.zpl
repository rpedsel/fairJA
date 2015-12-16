set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 2.5172, <2> 24.8976, <3> 8.9972, <4> 11.4273, <5> 6.847, <6> 25.8941, <7> 19.836, <8> 37.6908, <9> 29.4485, <10> 11.5787, <11> 2.1874, <12> 3.251, <13> 46.7874, <14> 11.0762, <15> 42.0411, <16> 41.4008, <17> 41.5627, <18> 0.9801, <19> 4.7221, <20> 2.7762;
param workload[JOB] := <1> 24.04, <2> 7.7646, <3> 10.8753, <4> 17.8741, <5> 35.6575, <6> 48.595, <7> 16.9534, <8> 38.2562, <9> 33.2944, <10> 14.4063, <11> 7.2771, <12> 47.1953, <13> 22.1727, <14> 48.2134, <15> 2.5567, <16> 13.7972, <17> 48.7286, <18> 46.4272, <19> 34.3696, <20> 48.4753;
param capacity[MACHINE] := <1> 94.4883, <2> 94.4883, <3> 94.4883, <4> 94.4883, <5> 94.4883, <6> 94.4883;

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
