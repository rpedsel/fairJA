set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 16.1245, <2> 10.7332, <3> 30.6485, <4> 15.695, <5> 27.394, <6> 25.2095, <7> 14.4273, <8> 5.4796, <9> 46.6957, <10> 32.4675, <11> 38.9555, <12> 44.1334, <13> 28.0272, <14> 32.0203, <15> 48.7247, <16> 9.8262, <17> 9.514, <18> 48.2918, <19> 29.2625, <20> 26.4057;
param workload[JOB] := <1> 42.045, <2> 37.2551, <3> 42.0678, <4> 48.2746, <5> 45.4903, <6> 22.3188, <7> 46.5593, <8> 32.962, <9> 10.2251, <10> 17.563, <11> 8.0409, <12> 34.3477, <13> 40.142, <14> 17.8739, <15> 44.6503, <16> 22.2567, <17> 33.98, <18> 45.9849, <19> 33.8644, <20> 25.8646;
param capacity[MACHINE] := <1> 69.8321, <2> 69.8321, <3> 69.8321, <4> 69.8321, <5> 69.8321, <6> 69.8321, <7> 69.8321;

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
