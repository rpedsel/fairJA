set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 20.451, <2> 32.5755, <3> 26.9817, <4> 28.7374, <5> 15.1488, <6> 27.945, <7> 20.8226, <8> 30.7078, <9> 28.28, <10> 24.9602, <11> 18.4489, <12> 27.2851, <13> 31.1329, <14> 27.9356, <15> 24.7462, <16> 21.5012, <17> 23.704, <18> 27.1308, <19> 23.3359, <20> 24.9719;
param workload[JOB] := <1> 37.7778, <2> 2.3221, <3> 25.5697, <4> 34.4921, <5> 49.0779, <6> 35.0903, <7> 47.5315, <8> 42.7233, <9> 37.4267, <10> 28.9731, <11> 0.7277, <12> 31.5458, <13> 28.7404, <14> 0.4167, <15> 42.6882, <16> 21.3856, <17> 2.7932, <18> 21.2011, <19> 16.109, <20> 15.2678;
param capacity[MACHINE] := <1> 521.86, <2> 521.86, <3> 521.86, <4> 521.86, <5> 521.86, <6> 521.86;

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
