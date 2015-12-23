set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 32.4739, <2> 14.3574, <3> 29.4473, <4> 18.5159, <5> 45.4038, <6> 47.8823, <7> 49.4857, <8> 16.7507, <9> 1.5696, <10> 12.5143, <11> 40.4405, <12> 40.1515, <13> 48.2315, <14> 31.1452, <15> 13.858, <16> 33.255, <17> 27.7778, <18> 37.8712, <19> 3.5869, <20> 21.7822;
param workload[JOB] := <1> 32.4739, <2> 14.3574, <3> 29.4473, <4> 18.5159, <5> 45.4038, <6> 47.8823, <7> 49.4857, <8> 16.7507, <9> 1.5696, <10> 12.5143, <11> 40.4405, <12> 40.1515, <13> 48.2315, <14> 31.1452, <15> 13.858, <16> 33.255, <17> 27.7778, <18> 37.8712, <19> 3.5869, <20> 21.7822;
param capacity[MACHINE] := <1> 566.5007, <2> 566.5007, <3> 566.5007, <4> 566.5007, <5> 566.5007, <6> 566.5007, <7> 566.5007;

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
