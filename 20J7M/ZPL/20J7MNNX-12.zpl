set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 18.5868, <2> 24.4694, <3> 28.2082, <4> 19.4945, <5> 20.4224, <6> 21.7578, <7> 32.391, <8> 12.8064, <9> 22.4882, <10> 17.1522, <11> 20.3902, <12> 26.2318, <13> 33.3521, <14> 25.85, <15> 17.4703, <16> 21.8913, <17> 18.2995, <18> 24.2906, <19> 20.5377, <20> 35.0155;
param workload[JOB] := <1> 4.3112, <2> 4.9467, <3> 5.3111, <4> 4.4153, <5> 4.5191, <6> 4.6645, <7> 5.6913, <8> 3.5786, <9> 4.7422, <10> 4.1415, <11> 4.5156, <12> 5.1217, <13> 5.7751, <14> 5.0843, <15> 4.1797, <16> 4.6788, <17> 4.2778, <18> 4.9285, <19> 4.5319, <20> 5.9174;
param capacity[MACHINE] := <1> 95.3323, <2> 95.3323, <3> 95.3323, <4> 95.3323, <5> 95.3323, <6> 95.3323, <7> 95.3323;

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
