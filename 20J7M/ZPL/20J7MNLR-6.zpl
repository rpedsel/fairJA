set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 29.2601, <2> 34.3309, <3> 25.478, <4> 26.1949, <5> 24.618, <6> 25.8935, <7> 27.3911, <8> 29.7456, <9> 30.4913, <10> 27.2005, <11> 27.4504, <12> 13.3549, <13> 27.8105, <14> 22.9708, <15> 26.5944, <16> 16.5387, <17> 17.472, <18> 13.3499, <19> 23.0653, <20> 28.4323;
param workload[JOB] := <1> 3.5872, <2> 3.2484, <3> 22.278, <4> 49.8461, <5> 32.0307, <6> 31.1753, <7> 31.3416, <8> 0.3836, <9> 46.0758, <10> 16.1673, <11> 2.3106, <12> 22.2228, <13> 29.0851, <14> 24.5185, <15> 18.2397, <16> 49.8924, <17> 8.8105, <18> 36.0009, <19> 26.7131, <20> 30.832;
param capacity[MACHINE] := <1> 69.2514, <2> 69.2514, <3> 69.2514, <4> 69.2514, <5> 69.2514, <6> 69.2514, <7> 69.2514;

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
