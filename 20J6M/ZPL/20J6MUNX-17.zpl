set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 12.019, <2> 21.3167, <3> 46.1996, <4> 29.1542, <5> 3.6622, <6> 7.8098, <7> 29.4737, <8> 44.2754, <9> 26.1273, <10> 21.2905, <11> 27.6271, <12> 40.9188, <13> 32.0483, <14> 37.9154, <15> 17.4391, <16> 0.8112, <17> 1.9928, <18> 18.6489, <19> 49.6969, <20> 19.9017;
param workload[JOB] := <1> 3.4668, <2> 4.617, <3> 6.797, <4> 5.3995, <5> 1.9137, <6> 2.7946, <7> 5.429, <8> 6.654, <9> 5.1115, <10> 4.6142, <11> 5.2561, <12> 6.3968, <13> 5.6611, <14> 6.1575, <15> 4.176, <16> 0.9007, <17> 1.4117, <18> 4.3184, <19> 7.0496, <20> 4.4611;
param capacity[MACHINE] := <1> 92.5863, <2> 92.5863, <3> 92.5863, <4> 92.5863, <5> 92.5863, <6> 92.5863;

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
