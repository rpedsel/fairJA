set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 12.918, <2> 31.2868, <3> 10.7587, <4> 19.5823, <5> 28.9437, <6> 25.8417, <7> 46.3097, <8> 36.1318, <9> 41.8309, <10> 10.8852, <11> 45.6765, <12> 44.9123, <13> 49.3367, <14> 12.8144, <15> 38.4143, <16> 3.1015, <17> 17.8366, <18> 8.4903, <19> 18.5607, <20> 18.1688;
param workload[JOB] := <1> 3.5942, <2> 5.5935, <3> 3.28, <4> 4.4252, <5> 5.3799, <6> 5.0835, <7> 6.8051, <8> 6.011, <9> 6.4677, <10> 3.2993, <11> 6.7584, <12> 6.7017, <13> 7.024, <14> 3.5797, <15> 6.1979, <16> 1.7611, <17> 4.2233, <18> 2.9138, <19> 4.3082, <20> 4.2625;
param capacity[MACHINE] := <1> 12.2087, <2> 12.2087, <3> 12.2087, <4> 12.2087, <5> 12.2087, <6> 12.2087;

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
