set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 26.271, <2> 24.2315, <3> 25.7982, <4> 21.8216, <5> 19.42, <6> 28.8744, <7> 21.4235, <8> 17.1189, <9> 22.2232, <10> 21.9554, <11> 28.2779, <12> 31.9864, <13> 24.1251, <14> 18.6506, <15> 21.4885, <16> 16.1811, <17> 23.8634, <18> 32.7928, <19> 29.9049, <20> 33.3851;
param workload[JOB] := <1> 41.078, <2> 34.0662, <3> 44.5998, <4> 2.2828, <5> 47.2271, <6> 31.4222, <7> 24.0371, <8> 44.0837, <9> 7.3344, <10> 1.2752, <11> 0.4083, <12> 18.6718, <13> 22.6274, <14> 30.9273, <15> 3.9683, <16> 28.6942, <17> 44.7397, <18> 26.0933, <19> 24.418, <20> 42.5142;
param capacity[MACHINE] := <1> 55.7645, <2> 55.7645, <3> 55.7645, <4> 55.7645, <5> 55.7645, <6> 55.7645, <7> 55.7645;

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
