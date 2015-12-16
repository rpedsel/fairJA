set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 5.0721, <2> 24.0744, <3> 33.3207, <4> 45.6455, <5> 27.4007, <6> 34.0601, <7> 27.3045, <8> 33.3558, <9> 12.3001, <10> 16.6727, <11> 3.2638, <12> 14.1023, <13> 22.4301, <14> 24.583, <15> 33.0955, <16> 21.431, <17> 18.49, <18> 32.533, <19> 49.5475, <20> 11.0005;
param workload[JOB] := <1> 0.5976, <2> 3.5525, <3> 32.6022, <4> 44.7354, <5> 45.9884, <6> 24.7942, <7> 25.6015, <8> 4.2552, <9> 38.6833, <10> 28.3665, <11> 34.2511, <12> 36.0257, <13> 32.5354, <14> 30.3043, <15> 35.6535, <16> 49.5808, <17> 1.0954, <18> 22.0861, <19> 42.391, <20> 32.7805;
param capacity[MACHINE] := <1> 565.8806, <2> 565.8806, <3> 565.8806, <4> 565.8806, <5> 565.8806, <6> 565.8806;

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
