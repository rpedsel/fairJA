set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 39.8547, <2> 22.4843, <3> 2.415, <4> 31.3183, <5> 44.1668, <6> 16.3384, <7> 22.6085, <8> 38.3011, <9> 36.1853, <10> 40.0906, <11> 9.7054, <12> 7.0429, <13> 38.149, <14> 32.5917, <15> 46.9294, <16> 40.407, <17> 9.8695, <18> 39.5561, <19> 14.8738, <20> 47.5002;
param workload[JOB] := <1> 39.8547, <2> 22.4843, <3> 2.415, <4> 31.3183, <5> 44.1668, <6> 16.3384, <7> 22.6085, <8> 38.3011, <9> 36.1853, <10> 40.0906, <11> 9.7054, <12> 7.0429, <13> 38.149, <14> 32.5917, <15> 46.9294, <16> 40.407, <17> 9.8695, <18> 39.5561, <19> 14.8738, <20> 47.5002;
param capacity[MACHINE] := <1> 62.1844, <2> 62.1844, <3> 62.1844, <4> 62.1844, <5> 62.1844, <6> 62.1844, <7> 62.1844;

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
