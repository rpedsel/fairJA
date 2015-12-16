set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 3.0514, <2> 11.9474, <3> 8.5991, <4> 5.9958, <5> 11.8017, <6> 49.2447, <7> 48.7975, <8> 20.464, <9> 23.8831, <10> 7.5421, <11> 0.7089, <12> 38.3023, <13> 28.8922, <14> 19.193, <15> 28.063, <16> 11.3342, <17> 30.1912, <18> 4.4423, <19> 39.3814, <20> 4.9108;
param workload[JOB] := <1> 3.0514, <2> 11.9474, <3> 8.5991, <4> 5.9958, <5> 11.8017, <6> 49.2447, <7> 48.7975, <8> 20.464, <9> 23.8831, <10> 7.5421, <11> 0.7089, <12> 38.3023, <13> 28.8922, <14> 19.193, <15> 28.063, <16> 11.3342, <17> 30.1912, <18> 4.4423, <19> 39.3814, <20> 4.9108;
param capacity[MACHINE] := <1> 49.5932, <2> 49.5932, <3> 49.5932, <4> 49.5932, <5> 49.5932, <6> 49.5932;

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
