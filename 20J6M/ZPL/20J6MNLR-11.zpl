set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 15.3515, <2> 25.0511, <3> 19.1525, <4> 23.2243, <5> 24.3486, <6> 22.1376, <7> 16.7286, <8> 21.059, <9> 29.972, <10> 20.9666, <11> 24.8879, <12> 30.6888, <13> 11.2136, <14> 22.4632, <15> 30.6707, <16> 23.972, <17> 26.4863, <18> 24.9264, <19> 12.5195, <20> 18.7162;
param workload[JOB] := <1> 0.2681, <2> 14.5039, <3> 41.1251, <4> 26.8566, <5> 12.2022, <6> 41.1166, <7> 9.9747, <8> 31.6729, <9> 24.0438, <10> 37.2772, <11> 33.5737, <12> 20.3515, <13> 39.5001, <14> 24.6437, <15> 14.5751, <16> 12.0152, <17> 4.9687, <18> 39.0085, <19> 34.9956, <20> 1.1097;
param capacity[MACHINE] := <1> 77.2972, <2> 77.2972, <3> 77.2972, <4> 77.2972, <5> 77.2972, <6> 77.2972;

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
