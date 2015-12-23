set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 24.2556, <2> 22.1712, <3> 18.7711, <4> 16.531, <5> 16.6052, <6> 24.996, <7> 23.4923, <8> 26.6397, <9> 26.4425, <10> 25.9636, <11> 31.3557, <12> 31.3332, <13> 30.0364, <14> 30.7314, <15> 29.04, <16> 26.1843, <17> 28.5528, <18> 28.6624, <19> 26.5992, <20> 31.0784;
param workload[JOB] := <1> 24.2556, <2> 22.1712, <3> 18.7711, <4> 16.531, <5> 16.6052, <6> 24.996, <7> 23.4923, <8> 26.6397, <9> 26.4425, <10> 25.9636, <11> 31.3557, <12> 31.3332, <13> 30.0364, <14> 30.7314, <15> 29.04, <16> 26.1843, <17> 28.5528, <18> 28.6624, <19> 26.5992, <20> 31.0784;
param capacity[MACHINE] := <1> 519.442, <2> 519.442, <3> 519.442, <4> 519.442, <5> 519.442, <6> 519.442, <7> 519.442;

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
